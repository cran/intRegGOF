\name{Utility Functions}
\alias{getLessThan}
\alias{mvPartOrd}
\alias{mvCumSum}
\alias{getContVar}
\alias{getModelCovars}
\alias{getModelWeights}
% \alias{hMean}
% \alias{relVar}
\alias{rWildBoot}



\title{ Utility functions for Integrated Regression Goodness of Fit }

\description{
  Functions that are basic or/and useful for the computation of the
  Integrated Regression Goodness of Fit
}

\usage{
  getLessThan(x, d)
  mvCumSum(x, ord)
  mvPartOrd(x1, x2)
  getContVar(df, vars = NULL)
  getModelCovars(obj)
  getModelWeights(obj)
  rWildBoot(n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x, d}{ matrix like structure. }
  \item{x1, x2}{ vectors with the same length. }
  \item{df}{ a data frame. }
  \item{ord}{ list of list structure with the ordering to add data
    points according to a given covariates.}
  \item{obj}{ An object of class \code{\link{lm}}, \code{\link{glm}} 
    or \code{\link{nls}}. }
  \item{vars}{ vector with variable names in observations data frame . }
  \item{n}{ integer, sample size. }
}
\details{
  \emph{...TODO: Each of them computes what in which way }
}

\author{ Jorge Luis Ojeda Cabrera (\email{jojeda@unizar.es}). }

\note{
  \code{getLessThan} can be ceitainly better implemented.
}

