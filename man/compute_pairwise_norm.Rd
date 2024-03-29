% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_pairwise_norm.R
\name{compute_pairwise_norm}
\alias{compute_pairwise_norm}
\title{Title Compute normalised mmpd}
\usage{
compute_pairwise_norm(
  .data,
  gran_x = NULL,
  gran_facet = NULL,
  response = NULL,
  quantile_prob = seq(0.01, 0.99, 0.01),
  dist_ordered = TRUE,
  lambda = 0.67,
  nperm = 100,
  seed = 9000
)
}
\arguments{
\item{.data}{data for which mmpd needs to be calculated}

\item{gran_x}{granularities mapped across x levels}

\item{gran_facet}{granularities mapped across facetss}

\item{response}{univarite response variable}

\item{quantile_prob}{probabilities}

\item{dist_ordered}{if categories are ordered}

\item{nperm}{number of permutations for normalization}

\item{seed}{seed considered}
}
\value{
weighted pairwise distances normalized using permutation approach
}
\description{
Title Compute normalised mmpd
}
\examples{
library(tidyverse)
library(gravitas)
library(parallel)
sm <- smart_meter10 \%>\%
  dplyr::filter(customer_id \%in\% c("10017936"))
gran_x <- "week_month"
gran_facet <- "wknd_wday"
v <- compute_pairwise_norm(sm, gran_x, gran_facet,
  response = general_supply_kwh, nperm = 20, lambda = 0.9
)
# month of the year not working in this setup
}
