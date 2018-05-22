\name{intRegGOF}
\alias{intRegGOF}
\alias{print.intRegGOF}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Integrated Regression Goodness of Fit }

\description{
  Integrated Regression Goodness of Fit to test if a given model 
  is suitable to represent the regression function for a given
  data.
}

\usage{
  intRegGOF(obj, covars = NULL, B = 499, LINMOD = FALSE)
  \method{print}{intRegGOF}(x,...)
}

\arguments{
  \item{obj}{ An object of class \code{\link{lm}}, \code{\link{glm}} or 
    \code{\link{nls}}. }
  \item{covars}{ Names of continuous (numerical) variates used to  
    compute Integrated Regression. They should be variables contained
    
in the data frame used to compute the regression fit.   }
  \item{B}{ Bootstrap resampling size.  }
  \item{LINMOD}{When \code{TRUE} and if \code{obj} is an object of class 
    \code{\link{lm}} Linear Model matrix fitting equations are used.  }
  \item{x}{ An object of class \code{intRegGOF}. }
  \item{\dots}{ Further parameters for print command. }
}

\details{
  The Integrated Regression Goodness of Fit technique is introduce in 
  Stute(1997). The main idea is to study the process that results
  from the cumulation of the residuals up to a given value of the 
  covariates. Once this process is built, different functional over 
  it can be considered to measure the discrepany between the true
  regression function and its estimation. 

  The tests that implements this function is
  \deqn{
    H_0:m\in M \ \textrm{vs} \ H_1:m\notin M
  }
  being \eqn{m} the regression function, and \eqn{M} a given class
  of functions. The statistics considered are
  \deqn{ K_n=\sup_{x\in R^d}|R^w_n(x)| }
  \deqn{ W^2_n=\int_{R^d}R^w_n(z)^2 \,dF(z). } 
  where \eqn{R^w_n(z)} is the cumulated residual process:
  \deqn{ R^w_n(x)=n^{-1/2}\sum^n_{i=1}(y_i-\hat y_i)I(x_i\le x). }

  As the stochastic behaviour of this cumulated residual process is 
  quite complex, the implementation of the technique is based on 
  resampling techniques. In particular the chosen implementation is
  based on Wild Bootstrap methods.

  The method also handles selection biased data by means of 
  compensation, by means of the weights used to fit the resgression 
  function when computing the cumulated residual process.

  At the moment only \code{'response'} type of residuals are considered,
  jointly with wild bootstrap resampling technique and the result for 
  discrete responses might no be proper. 
}

\value{
  This function returns an object of class \code{intRegGOF}, a 
  \code{list} which cointains following objects:
    \item{call }{The call to the function}
    \item{regObj }{String with the \code{lm}, \code{glm} or \code{nls}
      object whose fit is cheked}
    \item{regModel }{\code{lm}, \code{glm} or \code{nls} object call.}
    \item{p.value }{\eqn{p}--values for \eqn{K_n} and \eqn{W^2_n} statistics.}
    \item{datStat }{value of \eqn{K_n} and \eqn{W^2_n} statistics.}
    \item{covars }{ continuous (numerical) variates used to  
      compute Integrated Regression.}
    \item{intErr }{ cumulated residual process at the values of 
      \code{covars} in data.}
    \item{xLT }{structure with the order of \code{covars} summation. }
    \item{bootSamp}{ Bootstrap samples for \eqn{K_n} and \eqn{W^2_n}. }
}

\encoding{utf-8}

\references{
  Stute, W. (1997). 
  \emph{Nonparametric model checks for regression}. 
  Ann. Statist.,  25(2), pp. 613--641.

  Ojeda, J. L., W. González-Manteiga W. and Cristóbal, J. A
  \emph{A bootstrap based Model Checking for Selection--Biased data}
  Reports in Statistics and Operations Research, U. de Santiago de Compostela.
  Report 07-05
  \url{http://eio.usc.es/eipc1/BASE/BASEMASTER/FORMULARIOS-PHP-DPTO/REPORTS/447report07_05.pdf}

  Ojeda, J. L., Cristóbal, J. A., and Alcalá, J. T. (2008). 
  \emph{ A bootstrap approach to model checking for linear models 
  under length-biased data}. 
  Ann. Inst.  Statist. Math., 60(3), pp. 519--543.
}
\author{ Jorge Luis Ojeda Cabrera (\email{jojeda@unizar.es}). }

\note{
  This method requires more testing, and careful study of the 
  effect of factors (discrete random variables) when fitting 
  the model.
}

\seealso{
  \code{\link{lm}}, \code{\link{glm}}, \code{\link{nls}} and its methods 
  \code{\link{summary}}, \code{\link{print}}, \code{\link{plot}}, etc... 
}
\examples{
n <- 50
d <- data.frame( X1=runif(n),X2=runif(n))
d$Y <- 1 + 2*d$X1 + rnorm(n,sd=.125)
plot( d ) 
intRegGOF(lm(Y~X1+X2,d),B=99)
intRegGOF(a <- lm(Y~X1-1,d),B=99) 
intRegGOF(a,c("X1","X2"),B=99) 
intRegGOF(a,~X2+X1,B=99) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ regression }
\keyword{ nonlinear }
\keyword{ goodnes of fit }


