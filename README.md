# technocolor: colour palettes based on electronic music records

The technocolor package contains colour palettes based on the album
artwork some of my favourite electronic music records.

## Installation

``` r
devtools::install_github("sophiemeakin/technocolour")
```

## Usage

The `technocolours()` function makes a discrete colour palette based on
your chosen track, specified with `name = "track_name"`. The option `n`
allows you to specify the number of colours in the palette, which is 6
by default.

### Availble palettes

List the names of all available palettes with `list_palettes()`:

``` r
list_palettes()
```

    ## [1] "esther"           "fluorescent_rush" "glue"             "hot_bot"         
    ## [5] "ibrik"            "poodle_power"

### Visualise palettes

Visualise a named palette with `print_palette()`:

``` r
print_palette(name = "esther")
```

![](man/figures/vis_palettes-1.png)

``` r
print_palette(name = "fluorescent_rush")
```

![](man/figures/vis_palettes-2.png)

``` r
print_palette(name = "glue")
```

![](man/figures/vis_palettes-3.png)

``` r
print_palette(name = "hot_bot")
```

![](man/figures/vis_palettes-4.png)

``` r
print_palette(name = "ibrik")
```

![](man/figures/vis_palettes-5.png)

``` r
print_palette(name = "poodle_power")
```

![](man/figures/vis_palettes-6.png)

### Examples

``` r
ggplot(data = iris,
       aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point(size = 3) +
  scale_color_techno(name = "hot_bot") +
  theme_bw() +
  theme(legend.position = "top",
        text = element_text(size = 14))
```

![](man/figures/example1-1.png)

### Palette info

Print the track name, artist name and URL link for a named palette with
`info()`:

``` r
info("fluorescent_rush")
```

    ## Track name:  One More Fluorescent Rush 
    ##     Artist:  Avalon Emerson 
    ##        URL:  https://avalonemerson.bandcamp.com/track/one-more-fluorescent-rush
