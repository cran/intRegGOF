\name{anovarIntReg}
\alias{anovarIntReg}
\alias{print.anovarIntReg}
%% \alias{plot.anovarIntReg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Integrated Regression Goodness of Fit }

\description{
  Integrated Regression Goodness of Fit to test the adequacy of 
  different model to represent the regression function for a given
  data.
}

\usage{
  anovarIntReg(objH0, ..., covars = NULL, B = 499, 
    LINMOD = FALSE, INCREMENTAL = FALSE)
  print.anovarIntReg(x,...)
}

\arguments{
  \item{objH0}{ An object of class \code{\link{lm}}, \code{\link{glm}}
    or \code{\link{nls}} which will be considered as hull hypotheses 
    model or the base reference mode when \code{INCREMENTAL} is set
    to \code{TRUE}}. 
  \item{\dots}{One or more objects of class \code{\link{lm}}, \code{\link{glm}}
    or \code{\link{nls}}}
  \item{covars}{ Names of continuous (numerical) variates used to  
    compute Integrated Regression. They should be variables contained
    in the data frame used to compute the regression fit. When NULL it 
    is obtained as the max. number of different covariates in all tested 
    models. It also can be  a \code{\link{formula}} like \code{~x1+x2+...}. }
  \item{B}{ Bootstrap resampling size.  }
  \item{LINMOD}{When \code{TRUE} and if \code{obj} is an object of class 
    print.intRegGOFprint.intRegGOF\link{lm} Linear Model matrix fitting equations are used. }
  \item{INCREMENTAL}{ When is \code{FALSE} all models in \dots are 
    tested against \code{objH0}, while when \code{TRUE} each of the
    models are checked against the next one startin in \code{objH0}.}
  \item{x}{ An object of class \code{anovarIntReg}. }
}

\details{
  This function implements the test
  \deqn{
    H_0:m\in M_0 \ \textrm{vs} \ H_1:m\in M_1
  }
  for two different models \eqn{M_0}, \eqn{M_1} using the
  Integrated Regression Goodness of Fit as os done in \code{\link{intRegGOF}},
  but instead of the accumulation of the residual of a givem model, in
  this case, the accumuation of the difference in the fits is considered:
  \deqn{ 
    R^w_n(x)=n^{-1/2}\sum^n_{i=1}(\hat y_{0i}-\hat y_{1i})I(x_i\le x). 
  }
  The test statistics considered are $K_n$ and $W^2_n$.

  If \code{objH0} and  \code{objH1} are \code{\link{lm}}, \code{\link{glm}}
  or \code{\link{nls}} fits for the models in classes \eqn{M_0} and 
  \eqn{M_1} respectively, then \code{anovarIntReg(objH0,objH1)} computes 
  test \eqn{H_0:m\in M_0} vs \eqn{H_1:m\notin M_1}. When 
  \code{anovarIntReg(objH0,objH1,\dots,objHk)} is executed (notice 
  that by default \code{INCREMENTAL=FALSE}) we obtain a table with 
  the statistics \eqn{K_n} and \eqn{W^2_n} and its associated 
  \eqn{p}-values for each of the tests \eqn{H_0:m\in M_0} vs 
  \eqn{H_i:m\notin M_i} being \eqn{i=1,\dots,k}. On the other hand, 
  if the parameter \code{INCREMENTAL} is set to \code{TRUE}, the 
  command returns the results for the tests \eqn{H_i:m\in M_i} vs
  \eqn{H_{i+1}:m\notin M_{i+1}} being \eqn{i=1,\dots,k-1}.
}

\value{
  This function returns an object of class \code{anovarIntReg}, a 
  matrix like \code{structure} whose rows refers to models and
  columns to statistics and its \eqn{p}-values. It also has 
  an attribute \code{heading} to support printing the object. 
}


\author{ Jorge Luis Ojeda Cabrera (\email{jojeda@unizar.es}). }

\note{
  This method requires more testing, and careful study of the 
  effect of factors (discrete random variables) when fitting 
  the model.
}

\seealso{
  \code{\link{lm}}, \code{\link{glm}}, \code{\link{nls}}, 
  and \code{\link{intRegGOF}}.
}

\examples{
  n <- 50
  d <- data.frame( X1=runif(n),X2=runif(n))
  d$Y <- 1 - 2*d$X1 - 5*d$X2 + rnorm(n,sd=.125)
  a0 <- lm(Y~1,d) 
  a1 <- lm(Y~X1,d) 
  a2 <- lm(Y~X1+X2,d) 
  anovarIntReg(a0,a1,a2,B=50) 
  anovarIntReg(a0,a1,a2,B=50,INCREMENTAL=TRUE) 
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ regression }
\keyword{ nonlinear }
\keyword{ goodnes of fit }
