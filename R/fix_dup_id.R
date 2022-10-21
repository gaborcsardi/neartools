#' Fix replicated id in a data file
#'
#' In NEAR, we use ID (lopnr) to identify a specific participant. If two people share the same ID, there must be a problem.
#' This function is used to:
#' * Check if a data file has replicated ID.
#' * If there is replicated id, find out which IDs are replicated. Generate new distinct new id & append it before the original ID column.
#'
#' The new ID can be temporarily used as primary key when importing data to MySQL.
#'
#' @param df A tibble to be examined.
#'
#' @return A list with examination results
#' \itemize{
#'   \item logic_rep: If df has replicated ID or not.
#'   \item new_lopnr: A new distinct ID. E.g, for both people with ID = 2, the new ID are 2.0, 2.1.
#'   \item replicated_id: Specific replicated ID. May need to report them to local DBM.
#'   \item df_update: A new df with new_lopnr appened before original ID column.
#' }
#' @export
#'
#' @import magrittr
#' @import dplyr
#' @import tibble
#'
#'
#' @examples
#' \dontrun{
#' neartools::fix_dup_id(baseline_example_Relative_220504)$logic_rep
#' }
#'
#'
fix_dup_id <- function(df) {
  df_name <- deparse(substitute(df))
  # select the column of id
  id_nr <- df %>%
    select(contains("lopnr")) %>%
    colnames(.)

  if (length(unique(df[[id_nr]])) == length(df[[id_nr]])) {
    stop("There is no duplicated id!")
  } else {
    message(paste0("New lopnr added to: ", df_name))
  }
  # freq table of column contains "lopnr"
  n_occur <- data.frame(table(
    df %>%
      select(id_nr)
  ))
  # filter out replicated id
  freq_tab <- n_occur[n_occur$Freq > 1, ]
  # find the replicated id
  rep_id <- freq_tab$Var1
  # store new lopnr
  new_lopnr <- c()
  i <- 1
  while (i <= nrow(df)) {
    id_check <- as.numeric(df[i, id_nr])
    if (!id_check %in% rep_id) {
      new_lopnr[i] <- id_check
      i <- i + 1
    } else if (id_check %in% rep_id) {
      rep_freq <-
        freq_tab %>%
        filter(Var1 == id_check) %>%
        pull(Freq)
      new_lopnr[i:(i + rep_freq - 1)] <- id_check + 0.1 * seq(0, rep_freq - 1)
      i <- i + rep_freq
    }
  }
  # add new id to the df
  df_update <- df %>% add_column(new_lopnr = new_lopnr, .before = id_nr)
  return(list(
    logic_rep = !length(unique(df[[id_nr]])) == length(df[[id_nr]]),
    new_lopnr = new_lopnr,
    replicated_id = rep_id,
    df_update = df_update
  ))
}
