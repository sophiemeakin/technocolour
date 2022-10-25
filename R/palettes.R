#' Electronic music artwork colour palettes
#'
#' A dataset containing some colour palettes inspired by electronic music record artwork.
#'
#'@format A data frame containing all the colours used in the palette:
#'\itemize{
#'   \item palette: The name of the palette
#'   \item palette_type: The type of palette: qualitative, sequential, or diverging
#'   \item hex: Hex colour code
#'   \item artist: The artist of the track
#'   \item artist: The name of the record that the track appears on, and on which the palette is based
#'   \item track: The name of the track
#'   \item url: A link to the track
#'}
"techno_palettes"


#' List all available palettes
#'
#' List the names of all palettes available in technocolour.
#'
#' @param type The type of colour palette. One of: "qualitative", "sequential", "diverging".
#'
#' @return A vector of character strings of all available palettes.
#'
#' @examples
#' list_palettes()
#'
#' @rdname list_palettes
#' @export
list_palettes <- function(type) {

  # Checks for type
  if(missing(type)) {
    type <- c("qualitative", "sequential", "diverging")
  } else if(!type %in% c("qualitative", "sequential", "diverging")) {
    stop("Palette type invalid - choose one of: qualitative, sequential, or diverging")
  }

  # Get palettes
  pals <- unique(
    technocolour::techno_palettes[technocolour::techno_palettes$palette_type %in% type,
                                        c("palette", "palette_type")]
    )

  out <- sort(pals$palette)

  return(out)

}


#' Make a technocolour palette
#'
#' Makes a discrete colour palette of length \code{n} from the chosen technocolour palette.
#'
#' @param palette The name of the chosen palette. Choices are from: \code{"bodied"}, \code{"esther"},  \code{"hotbot"}, \code{"ibrik"}, \code{"poodle"}, \code{"rush"}, \code{"x"}.
#' @param n The integer length of the desired palette. Default value is the length of the specified palette.
#' @param interpolate Boolean. Indicates whether sequential or diverging palettes should interpolate between colours; this argument is not available for qualitative palettes. Default value is TRUE.
#'
#' @return A vector of colours.
#'
#' @examples
#' technocolours(palette = "rush", n = 6)
#'
#' @rdname technocolours
#' @export
technocolours <- function(palette, n, interpolate = TRUE) {

  # Checks for palette name
  if(!palette %in% technocolour::techno_palettes$palette) {
    stop("Palette not found - check palette name.")
  }

  # Load basic palette
  pal <- technocolour::techno_palettes$hex[technocolour::techno_palettes$palette == palette]
  pal_type <- unique(technocolour::techno_palettes$palette_type[technocolour::techno_palettes$palette == palette])

  # Checks for n
  if(missing(n)) {
    n <- length(pal)
  } else if(!is.numeric(n) | (is.numeric(n) & n/floor(n) != 1)) {
    stop("Parameter n is not an integer - assign integer value to n.")
  }

  # Checks for interpolate
  if(pal_type == "qualitative") {
    interpolate <- FALSE
  }

  # Make the palette!
  if(interpolate) {
    out <- grDevices::colorRampPalette(pal)(n)
  } else {
    out <- pal[1:n]
  }

  structure(out, class = "palette", name = palette)

}


#' Make a ggplot colour scale
#'
#' Makes a discrete colour scale of length \code{n} from the chosen technocolour palette.
#'
#' @inheritParams technocolours
#'
#' @return A discrete scale to use for colour in ggplot.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(data = iris,
#' aes(x = Petal.Length, y = Petal.Width, col = Species)) +
#' geom_point(size = 3) +
#' scale_color_techno(palette = "bodied", n = 3)
#'
#' @importFrom ggplot2 ggplot aes scale_color_manual
#'
#' @rdname scale_color_techno
#' @export
scale_color_techno <- function(palette, n, ...) {

  out <- scale_color_manual(values = technocolours(palette = palette, n = n, ...))

  return(out)

}


#' Make a ggplot fill scale
#'
#' Makes a discrete fill scale of length \code{n} from the chosen technocolour palette.
#'
#' @inheritParams technocolours
#'
#' @return A discrete scale to use for fill in ggplot.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(data = iris,
#' aes(x = Species, y = Petal.Width, fill = Species)) +
#' geom_violin() +
#' scale_fill_techno(palette = "hotbot", n = 3)
#'
#' @inheritParams technocolours
#'
#' @importFrom ggplot2 ggplot aes scale_fill_manual
#'
#' @rdname scale_fill_techno
#' @export
scale_fill_techno <- function(palette, n, ...) {

  out <- scale_fill_manual(values = technocolours(palette = palette, ...))

  return(out)

}


#' Print a palette
#'
#' Prints the chosen technocolour palette of length \code{n}.
#'
#' @inheritParams technocolours
#'
#' @return A plot showing the colours of the chosen technocolour colour palette.
#'
#' @examples
#' print_palette(palette = "esther")
#' print_palette(palette = "esther", n = 5)
#' print_palette(palette = "esther", n = 5, interpolate = FALSE)
#'
#' @importFrom graphics image
#'
#' @rdname print_palette
#' @export
print_palette <- function(palette, n, ...) {

  col <- technocolour::technocolours(palette = palette, n = n, ...)

  image(1:length(col), 1, as.matrix(1:length(col)), col = col,
        main = palette, cex.main = 2,
        ylab = "", xlab = " ", xaxt = "n", yaxt = "n",  bty = "n")

}


#' Print record information
#'
#' Prints the track name, artist and URL link for the chosen technocolour palette.
#'
#' @inheritParams technocolours
#'
#' @return Prints the track name, artist and URL link for the chosen technocolour palette.
#'
#' @examples
#' info(palette = "rush")
#'
#' @rdname info
#' @export
info <- function(palette) {

  if(!palette %in% technocolour::techno_palettes$palette){
    stop("Palette not found - check palette name")
  }

  pal <- technocolour::techno_palettes[technocolour::techno_palettes$palette == palette,
                                       c("artist", "record", "track", "url")]

  artist <- unique(pal$artist)
  record <- unique(pal$record)
  track <- unique(pal$track)
  url <- unique(pal$url)

  cat("     Artist: ", artist, "\n",
      "    Record: ", record, "\n",
      "Track name: ", track, "\n",
      "       URL: ", url)

}
