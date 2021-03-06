\name{kalamkar.wheat.uniformity}
\alias{kalamkar.wheat.uniformity}
\docType{data}
\title{
  Uniformity trial of wheat
}
\description{
  Uniformity trial of wheat at Rothamsted, UK in 1931.
}
\usage{data("kalamkar.wheat.uniformity")}
\format{
  A data frame with 1280 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, grams/half-meter}
    \item{\code{ears}}{ears per half-meter}
  }
}
\details{

  Kalamkar's paper published in 1932. Estimated crop year 1931.
  
  Plot 18 of the Four Course Rotation Experiment, Great Hoos, at
  Rothamsted, UK was used.  Sown with Yeoman II wheat.

  Field length: 80 rows * 6 inches apart = 40 feet.

  Field width = 16 segments * 0.5 meters = 8 meters.

  The grain yield and number of ears for each half-meter length were
  recorded. This is quite a small field, only 1/40 acre in size.

  Edge rows have higher yields. Row-end units have higher yields than
  interior units.  These border effects are significant. Variation
  between rows is greater than variation within rows. Negative
  correlation between rows may indicate competition effects.

  For ears, Kalamkar discarded 4 rows from each side and 3 half-meter lengths at each end.

  Kalamkar suggested using four parallel half-meter rows as a sampling unit.

}

\source{
  Kalamkar, R. J (1932).
  A Study in Sampling Technique with Wheat.
  The Journal of Agricultural Science, Vol.22(4), pp.783-796.
  https://doi.org/10.1017/S0021859600054599
}

\references{
  None.
}
\examples{
data(kalamkar.wheat.uniformity)
dat <- kalamkar.wheat.uniformity
plot(yield ~ ears, dat, main="kalamkar.wheat.uniformity")

# totals match Kalamkar
sum(dat$yield)
sum(dat$ears)

if(require(desplot)){
  desplot(ears ~ col*row, dat,
          flip=TRUE, aspect=(80*0.5)/(16*1.64042), # true aspect
          main="kalamkar.wheat.uniformity - ears")
  desplot(yield ~ col*row, dat,
          flip=TRUE, aspect=(80*0.5)/(16*1.64042), # true aspect
          main="kalamkar.wheat.uniformity - yield")
}

# Show the negative correlation between rows
## require(asreml)
## require(lucid)
## dat <- dat %>% mutate(rowf=factor(row), colf=factor(col)) %>%
##   arrange(rowf,colf)
## m1=asreml(yield ~ 1, data=dat, rcov= ~ ar1(rowf):ar1(colf))
## vc(m1)
##  ##     effect component std.error z.ratio constr
##  ## R!variance  81.54      3.527      23        P
##  ## R!rowf.cor  -0.09465   0.0277     -3.4      U
##  ## R!colf.cor   0.2977    0.02628    11        U

}
\keyword{datasets}
