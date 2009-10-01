\name{Core Functions}
\alias{compIntRegProc}
\alias{compBootSamp}
\alias{plotIntRegProc}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Utility functions for Integrated Regression Goodness of Fit }

\description{
  Core functions for the computation of the Integrated Regression 
  Goodness of Fit
}

\usage{
compIntRegProc(y, xord, weig = rep(1, length(y)))
compBootSamp(obj, datLT, B = 999, LINMOD = FALSE)
plotIntRegProc(y, x, weig = rep(1, length(y)), ADD = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{ vector, values to add to compute the Integrated Regression.}
  \item{xord}{ list of list with the index of covariate points that are 
  \emph{less than} covariate data. This tells how to cumulate according
  to covariates, }
  \item{weig}{ vector of weights, specifically used to fit and compute
  test statistics when data is selection biased. }
  \item{obj}{ An object of class \code{\link{lm}}, \code{\link{glm}} 
  or \code{\link{nls}}. }
  \item{datLT}{ structure as \code{xord} telling how to cumulate according
  to covariates. }
  \item{B}{ Bootstrap resampling size.  }
  \item{LINMOD}{When \code{TRUE} and if \code{obj} is an object of class 
    \code{\link{lm}} Linear Model matrix fitting equations are used. }
  \item{x}{ vector with covarates to plot }
  \item{ADD}{ If \code{TRUE} the plot is added to existing plot. }
  \item{\dots}{ Further parameters to plot. }
}

\details{
  \emph{...TODO: Each of them computes what in which way }
}


\author{ Jorge Luis Ojeda Cabrera (\email{jojeda@unizar.es}). }

\note{
  Surely they can better implemented.
}

