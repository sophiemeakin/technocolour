# technocolour: colour palettes based on electronic music records

The
[`technocolour`](https://sophiemeakin.github.io/technocolour/index.html)
package contains colour palettes based on the album artwork some of my
favourite electronic music records. Enjoy!

## Installation

You can install the package from Github:

``` r
devtools::install_github("sophiemeakin/technocolour")
```

## Available palettes

![](man/figures/unnamed-chunk-2-1.png)

## Quick-start guide

### List available palettes

List the names of all available palettes with
[`list_palettes()`](https://sophiemeakin.github.io/technocolour/reference/print_palette.html);
you can specify the type of palette (qualitative, sequential, or
diverging) with the argument `type`:

``` r
list_palettes()
```

    ## [1] "bodied" "esther" "hotbot" "ibrik"  "poodle" "rush"   "x"

### Visualise palettes

Preview a named palette with
[`print_palette()`](https://sophiemeakin.github.io/technocolour/reference/print_palette.html):

``` r
print_palette(name = "esther")
```

![](man/figures/vis_palettes-1.png)

### Using with ggplot2

Use
[`scale_color_techno()`](https://sophiemeakin.github.io/technocolour/reference/scale_color_techno.html)
and
[`scale_fill_techno()`](https://sophiemeakin.github.io/technocolour/reference/scale_fill_techno.html)
to use the palette in ggplot object:

``` r
ggplot(data = iris,
       aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point(size = 3) +
  scale_color_techno(name = "rush") +
  theme_bw() +
  theme(legend.position = "top",
        text = element_text(size = 14))
```

![](man/figures/example1-1.png)

### Palette info

Print the track name, artist name and URL link for a named palette with
[`info()`](https://sophiemeakin.github.io/technocolour/reference/info.html):

``` r
info("poodle")
```

    ##      Artist:  Avalon Emerson 
    ##      Record:  DJ-Kicks EP 
    ##  Track name:  Poodle Power 
    ##         URL:  https://avalonemerson.bandcamp.com/track/poodle-power

Please read the [package
documentation](https://sophiemeakin.github.io/technocolour/reference/index.html)
for full details of how to use package.

## Contributing

Please add new palettes based on your favourite records! Contributing
guide coming soon! 👀
