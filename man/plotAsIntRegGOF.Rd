\name{plot}
\alias{plotAsIntRegGOF}
\alias{pointsAsIntRegGOF}
\alias{linesAsIntRegGOF}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Integrated Regression Goodness of Fit graphical output }

\description{
  Methods to develop model validation and visualization 
  of Integrated Regression Goodness of Fit technique.
}

\usage{
  plotAsIntRegGOF(obj, covar = 1, ADD = FALSE, ...)
  pointsAsIntRegGOF(obj,covar=1,...)
  linesAsIntRegGOF(obj,covar=1,...)
}

\arguments{
  \item{obj}{ An object of class \code{\link{lm}}, \code{\link{glm}} 
    or \code{\link{nls}}. }
  \item{covar}{ Variable name, number or vector for which Int. Reg. 
    is computed. If it is a number, it reference a covariate in the 
    model frame, while if it is a name refer to data in data frame 
    using in the fitting process.
    }
  \item{ADD}{ If \code{TRUE} the plot is added to existing plot. }
  \item{\dots}{ Further parameters to for plotobj command. }
}

\details{
  Currently, the implementation computes the accumulated residual
  process against a single covariate (\code{covar}). When the value
  of \code{covar} is set to 0, the response is used as the variable
  whose residual are accumulated against. 

  Notice that if \code{covar} is a vector its lenght should be equal
  to the number of residuals. 
}

\author{ Jorge Luis Ojeda Cabrera (\email{jojeda@unizar.es}). }

\note{  \code{lm} objects that does not have a data parameter set
  when the call is executed does not work presently when the \code{covar}
  parameter is different than 0.
  }

\seealso{
  \code{\link{lm}}, \code{\link{glm}}, \code{\link{nls}} its 
  associated \code{\link{plot}} method and \code{\link{intRegGOF}}.
}

\examples{
  n <- 50
  d <- data.frame( X1=runif(n),X2=runif(n))
  d$Y <- 1 + 2*d$X1 + rnorm(n,sd=.125)
  par(ask=TRUE)
  plot( d ) 
  plotAsIntRegGOF(lm(Y~X1+X2,d),covar="X1") 
  plotAsIntRegGOF(a <- lm(Y~X1-1,d)) 
  plotAsIntRegGOF(a,c("X1")) 
  plotAsIntRegGOF(a,0) 
  plotAsIntRegGOF(a,fitted(a)) 
  par(ask=FALSE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ regression }
\keyword{ nonlinear }
\keyword{ goodnes of fit }
