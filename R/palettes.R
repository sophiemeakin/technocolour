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
#' @return A vector of character strings of all available palettes.
#'
#' @examples
#' list_palettes()
#'
#' @rdname list_palettes
#' @export
list_palettes <- function() {

  out <- sort(unique(technocolour::techno_palettes$palette))

  return(out)

}


#' Make a technocolour palette
#'
#' Makes a discrete colour palette of length \code{n} from the chosen technocolour palette.
#'
#' @param name The name of the chosen palette. Choices are from: \code{rush}, \code{glue}, \code{esther}, \code{hotbot}, \code{ibrik}, \code{poodle}
#' @param n The length of the palette, an integer between 1 and 6. Default is n = 6.
#'
#' @return A vector of colours.
#'
#' @examples
#' technocolours(name = "fluorescent_rush", n = 6)
#'
#' @rdname technocolours
#' @export
technocolours <- function(name, n = 6) {

  if(!name %in% technocolour::techno_palettes$palette){
    stop("Palette not found - check palette name.")
  }

  pal <- technocolour::techno_palettes$hex[technocolour::techno_palettes$palette == name]

  if(missing(n) | !is.numeric(n) | n < 1 | n > 6) {
    message("Parameter n is missing or out of range; default to n = 6.")
    n <- 6
  } else if(is.numeric(n) & n/floor(n) != 1) {
    message("Parameter n is not an integer; assigning to floor(n).")
    n <- floor(n)
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)

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
#' scale_color_techno(name = "bodied", n = 3)
#'
#' @importFrom ggplot2 ggplot aes scale_color_manual
#'
#' @rdname scale_color_techno
#' @export
scale_color_techno <- function(name, n = 6) {

  out <- scale_color_manual(values = technocolours(name = name, n = n))

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
#' scale_fill_techno(name = "hotbot", n = 3)
#'
#' @inheritParams technocolours
#'
#' @importFrom ggplot2 ggplot aes scale_fill_manual
#'
#' @rdname scale_fill_techno
#' @export
scale_fill_techno <- function(name, n = 6) {

  out <- scale_fill_manual(values = technocolours(name = name, n = n))

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
#' print_palette(name = "glue", n = 6)
#'
#' @importFrom graphics image
#'
#' @rdname print_palette
#' @export
print_palette <- function(name, n = 6) {

  if(missing(n) | !is.numeric(n) | n < 1 | n > 6) {
    message("Parameter n is missing or out of range; default to n = 6.")
    n <- 6
  } else if(is.numeric(n) & n/floor(n) != 1) {
    message("Parameter n is not an integer; assigning to floor(n).")
    n <- floor(n)
  }

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
#' @examples
#' info(name = "esther")
#'
#' @rdname info
#' @export
info <- function(name) {

  if(!name %in% technocolour::techno_palettes$palette){
    stop("Palette not found - check palette name")
  }

  pal <- technocolour::techno_palettes[technocolour::techno_palettes$palette == name,
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
