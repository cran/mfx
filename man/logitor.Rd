\name{logitor}
\alias{logitor}
\alias{print.logitor}
\title{Odds ratios for a logit regression.}
\description{
This function estimates a binary logistic regression model and calculates 
the corresponding odds ratios. }
\usage{
logitor(formula, data, robust = FALSE, clustervar1 = NULL, clustervar2 = NULL, 
        start = NULL, control = list())
}
\arguments{
  \item{formula}{an object of class ``formula'' (or one that can be coerced to that class).}
  \item{data}{the data frame containing these data. This argument must be used.}
  \item{robust}{if \code{TRUE} the function reports White/robust standard errors.}
  \item{clustervar1}{a character value naming the first cluster on which to adjust the standard errors.}
  \item{clustervar2}{a character value naming the second cluster on which to 
  adjust the standard errors for two-way clustering.}
  \item{start}{starting values for the parameters in the \code{\link[stats]{glm}} model.}
  \item{control}{see \code{\link[stats]{glm.control}}.}
}
\details{If both \code{robust=TRUE} and \code{!is.null(clustervar1)} the function overrides the \code{robust} 
command and computes clustered standard errors.}
\value{
\item{oddsratio}{a coefficient matrix with columns containing the estimates, 
associated standard errors, test statistics and p-values.}
\item{fit}{the fitted \code{\link[stats]{glm}} object.}
\item{call}{the matched call.}
}

\seealso{\code{\link{logitmfx}}, \code{\link[stats]{glm}}}

\examples{
# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)

# binary outcome
y = ifelse(pnorm(1 + 0.5*x + rnorm(n))>0.5, 1, 0)

data = data.frame(y,x)
logitor(formula=y~x, data=data)
}