% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ATE_continuous.R
\name{estmean.bilevel.subgroups}
\alias{estmean.bilevel.subgroups}
\title{Estimate the ATE of the mean difference in multiple bi-level subgroups
defined by the proportions}
\usage{
estmean.bilevel.subgroups(
  y,
  x.cate,
  x.ps,
  trt,
  score,
  higher.y,
  prop,
  onlyhigh,
  ps.method = "glm",
  minPS = 0.01,
  maxPS = 0.99
)
}
\arguments{
\item{y}{Observed outcome; vector of size \code{n} (observations)}

\item{x.cate}{Matrix of \code{p.cate} baseline covariates; dimension \code{n} by \code{p.cate} (covariates in the outcome model)}

\item{x.ps}{Matrix of \code{p.ps} baseline covariates (plus a leading column of 1 for the intercept);
dimension \code{n} by \code{p.ps + 1} (covariates in the propensity score model plus intercept)}

\item{trt}{Treatment received; vector of size \code{n} units with treatment coded as 0/1}

\item{score}{Estimated CATE scores for all \code{n} observations from one of the six methods
(boosting, linear regression, two regressions, contrast regression, random forest, generalized additive model); vector of size \code{n}}

\item{higher.y}{A logical value indicating whether higher (\code{TRUE}) or lower (\code{FALSE})
values of the outcome are more desirable. Default is \code{TRUE}.}

\item{prop}{Proportions corresponding to percentiles in the estimated CATE scores that define subgroups to calculate ATE for;
vector of floats in `(0, 1]` (if onlyhigh=T) or in `(0, 1)` (if onlyhigh=F):
             Each element of \code{prop} represents the high/low cutoff in each bi-level subgroup and the length of \code{prop}
             is number of bi-level subgroups}

\item{onlyhigh}{Indicator of returning only the ATEs in the higher-than-cutoff category of the bi-level subgroups; boolean}

\item{ps.method}{A character value for the method to estimate the propensity score. Allowed values include one of:
\code{'glm'} for logistic regression with main effects only (default), or
\code{'lasso'} for a logistic regression with main effects and LASSO penalization on
two-way interactions (added to the model if interactions are not specified in \code{ps.model}).
Relevant only when \code{ps.model} has more than one variable.}

\item{minPS}{A numerical value (in `[0, 1]`) below which estimated propensity scores should be
truncated. Default is \code{0.01}.}

\item{maxPS}{A numerical value (in `(0, 1]`) above which estimated propensity scores should be
truncated. Must be strictly greater than \code{minPS}. Default is \code{0.99}.}
}
\value{
ate.est.high: estimated ATEs in the multiple bi-level subgroups that are in the higher-than-cutoff category;
vector of size equal to the length of prop; always returned
        ate.est.low: estimated ATEs in the multiple bi-level subgroups that are in the lower-than-cutoff category;
        vector of size equal to the length of prop; returned only when \code{onlyhigh} == TRUE
}
\description{
If only care about the higher subgroup (above cutoff), only need
trt.est.high so set \code{onlyhigh} to be TRUE. Scores are adjusted to the
opposite sign if \code{higher.y} == FALSE; scores stay the same if
\code{higher.y} == TRUE. This is because \code{estcount.bilevel.subgroups}()
always takes the subgroup of the top highest adjusted scores,and higher
adjusted scores should always represent high responders in treatment group 1.
}
