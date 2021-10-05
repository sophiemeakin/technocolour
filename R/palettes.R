#' Electronic music artwork colour palettes
#'
#' A dataset containing some colour palettes inspired by electronic music record artwork.
#'
#'
#'@format A data frame containing all the colours used in the palette:
#'\itemize{
#'   \item palette: The name of the palette
#'   \item hex: Hex color code
#'   \item track: The name of the track on which the palette is based
#'   \item artist: The artist of the track
#'   \item url: A link to the track
#'}
"techno_palettes"


#' List all available palettes
#'
#' List the names of all palettes available in technocolour.
#'
#'
list_palettes <- function() {

  out <- sort(unique(technocolour::techno_palettes$palette))

  return(out)

}


#' Make a technocolour palette
#'
#' Makes a discrete colour palette of length \code{n} based on the drawn from the chosen technocolour palette.
#'
#' @param name The name of the chosen palette. Choices are from: \code{flourescent_rush}, \code{glue}, \code{esther}, \code{hot_bot}, \code{ibrik}, \code{poodle_power}
#' @param n The length of the palette, an integer between 1 and 6.
#'
#' @return A vector of colours.
#'
technocolours <- function(name, n) {

  if(!name %in% technocolour::techno_palettes$palette){
    stop("Palette not found - check palette name")
  }

  pal <- technocolour::techno_palettes$hex[technocolour::techno_palettes$palette == name]

  if(missing(n) | n < 1 | n > 6) {
    n <- 6
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)

}


#' Print a palette
#'
#' Prints the chosen technocolour palette of length \{n}.
#'
#' @inheritParams technocolours
#'
print_palette <- function(name = "fluorescent_rush", n = 6) {

  col <- technocolour::technocolours(name = name, n = n)

  image(1:n, 1, as.matrix(1:n), col = col,
        main = name, ylab = "", xlab = " ", xaxt = "n", yaxt = "n",  bty = "n")

}


#' Print palette information
#'
#' Prints the track name, artist and URL link for the chosen technocolour palette.
#'
#' @inheritParams technocolours
#'
#' @return Prints the track name, artist and URL link for the chosen technocolour palette.
#'
info <- function(name) {

  if(!name %in% technocolour::techno_palettes$palette){
    stop("Palette not found - check palette name")
  }

  pal <- technocolour::techno_palettes[technocolour::techno_palettes$palette == name,
                                       c("track", "artist", "url")]

  track <- unique(pal$track)
  artist <- unique(pal$artist)
  url <- unique(pal$url)

  cat("Track name: ", track, "\n",
      "   Artist: ", artist, "\n",
      "      URL: ", url)

}