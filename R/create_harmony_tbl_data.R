#' Create data for all harmony pairs in a harmony table
#'
#' @param .data a tsibble
#' @param harmony_tbl harmony table
#' @param response univariate response variable
#'
#' @return a list with each element containing a tibble with the harmony pair and response variable
#' @examples
#' library(gravitas)
#' library(dplyr)
#' sm <- smart_meter10 %>%
#'   dplyr::filter(customer_id %in% c("10017936"))
#' harmonies <- sm %>%
#'   harmony(
#'     ugran = "month",
#'     filter_in = "wknd_wday",
#'     filter_out = c("hhour", "fortnight")
#'   )
#' all_harmony <- create_harmony_tbl_data(sm,
#'   harmony_tbl = harmonies,
#'   response = general_supply_kwh
#' )
#' @export

create_harmony_tbl_data <- function(.data,
                                    harmony_tbl = NULL,
                                    response = NULL) {

  facet_variable <- x_variable <- NULL

  harmonies_split <- harmony_tbl %>%
    dplyr::group_by(
      facet_variable,
      x_variable
    ) %>%
    dplyr::group_split()

  data_split <- lapply(
    harmonies_split,
    function(x) {
      create_harmony_data(.data,
        harmony_tbl_row = x,
        response = {{ response }}
      )
    }
  )

  data_split
}
