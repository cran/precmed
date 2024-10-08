% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CATE_continuous.R
\name{twoarmglmmean.dr}
\alias{twoarmglmmean.dr}
\title{Doubly robust estimators of the coefficients in the contrast regression
 as well as their covariance matrix}
\usage{
twoarmglmmean.dr(y, x.cate, trt, ps, f1.predictor, f0.predictor)
}
\arguments{
\item{y}{Observed outcome; vector of size \code{n}}

\item{x.cate}{Matrix of \code{p.cate} baseline covariates; dimension \code{n} by \code{p.cate}}

\item{trt}{Treatment received; vector of size \code{n} units with treatment coded as 0/1}

\item{ps}{Estimated propensity scores for all observations; vector of size \code{n}}

\item{f1.predictor}{Initial predictions of the outcome (expected number of relapses for one unit of exposure time)
conditioned on the covariates \code{x} for treatment group trt = 1; \code{mu_1(x)}, step 1 in the two regression; vector of size \code{n}}

\item{f0.predictor}{Initial predictions of the outcome (expected number of relapses for one unit of exposure time)
conditioned on the covariates \code{x} for treatment group trt = 0; \code{mu_0(x)}, step 1 in the two regression; vector of size \code{n}}
}
\value{
coef: Doubly robust estimators of the regression coefficients \code{delta_0}; vector of size \code{p} + 1 (intercept included)
        vcov: Variance-covariance matrix of the estimated coefficient \code{delta_0}; matrix of size \code{p} + 1 by \code{p} + 1
}
\description{
Solving the estimating equation \code{bar S_n (delta) = 0}
}
