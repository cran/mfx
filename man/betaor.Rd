\name{betaor}
\alias{betaor}
\alias{print.betaor}
\title{Odds ratios for a beta regression.}
\description{
This function estimates a beta regression model and calculates the corresponding odds ratios. 
}
\usage{
betaor(formula, data, robust = FALSE, clustervar1 = NULL, clustervar2 = NULL, 
       control = betareg.control(), link.phi = NULL, type = "ML")
}
\arguments{
  \item{formula}{an object of class ``formula'' (or one that can be coerced to that class).}
  \item{data}{the data frame containing these data. This argument must be used.}
  \item{robust}{if \code{TRUE} the function reports White/robust standard errors.}
  \item{clustervar1}{a character value naming the first cluster on which to adjust the standard errors.}
  \item{clustervar2}{a character value naming the second cluster on which to 
  adjust the standard errors for two-way clustering.}
  \item{control}{a list of control arguments specified via \code{\link[betareg]{betareg.control}}.}
  \item{link.phi}{as in the \code{\link[betareg]{betareg}} function.}
  \item{type}{as in the \code{\link[betareg]{betareg}} function.}
  }

\details{The underlying link function in the mean model (mu) is "logit". If both \code{robust=TRUE} and 
\code{!is.null(clustervar1)} the function overrides the \code{robust} command and computes clustered 
standard errors.}
\value{
\item{oddsratio}{a coefficient matrix with columns containing the estimates, 
associated standard errors, test statistics and p-values.}
\item{fit}{the fitted \code{\link[betareg]{betareg}} object.}
\item{call}{the matched call.}
}


\references{
Francisco Cribari-Neto, Achim Zeileis (2010). Beta Regression in R. Journal of Statistical Software 34(2), 1-24. 

Bettina Gruen, Ioannis Kosmidis, Achim Zeileis (2012). Extended Beta Regression in R: Shaken, Stirred, Mixed, 
and Partitioned. Journal of Statistical Software, 48(11), 1-25.
}

\seealso{\code{\link{betamfx}}, \code{\link[betareg]{betareg}}}

\examples{
# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)

# beta outcome
y = rbeta(n, shape1 = plogis(1 + 0.5 * x), shape2 = (abs(0.2*x)))
# use Smithson and Verkuilen correction
y = (y*(n-1)+0.5)/n

data = data.frame(y,x)
betaor(y~x|x, data=data)
}