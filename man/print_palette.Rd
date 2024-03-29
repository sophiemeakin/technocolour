% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/palettes.R
\name{print_palette}
\alias{print_palette}
\title{Print a palette}
\usage{
print_palette(palette, n, ...)
}
\arguments{
\item{palette}{The name of the chosen palette. Choices are from: \code{"bodied"}, \code{"esther"},  \code{"hotbot"}, \code{"ibrik"}, \code{"poodle"}, \code{"rush"}, \code{"x"}.}

\item{n}{The integer length of the desired palette. Default value is the length of the specified palette.}
}
\value{
A plot showing the colours of the chosen technocolour colour palette.
}
\description{
Prints the chosen technocolour palette of length \code{n}.
}
\examples{
print_palette(palette = "esther")
print_palette(palette = "esther", n = 5)
print_palette(palette = "esther", n = 5, interpolate = FALSE)

}
