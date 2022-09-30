# Contributing to technocolour

Hi! Thanks for being interested in contributing to `technocolour` - here's everything you (should) need to get started! 💃🏻🕺🏻

## 🧑‍🎨 Adding new colour palettes

You'd like to add a new palette based on *your* favourite record's artwork? Great! Here's how:

1.  Find an image of your record e.g. on [bandcamp.com](https://bandcamp.com/) and copy the image URL.
2.  Open it on [coolors.co](https://coolors.co/image-picker) by selecting "Browse image" and pasting the image URL.
3.  Decide if you're making a qualitative, sequential or diverging colour palette - some images are better suited to one palette type vs. another!
4.  Create your masterpiece by selecting 6 colours from the image! You can also manually adjust the colours by exporting the palette (select "Export palette", and "Open in the generator").
5.  Once you've finalised the colours, [open an issue](https://github.com/sophiemeakin/technocolour/issues) with the title "New palette: \<your_palette_name", and include the following information:
    -   Palette name: one word based on the name of your record.
    -   Colours: the 6 hex codes of your colour palette.
    -   Palette URL: a URL to the palette in coolors: from the image picker, select "Export palette", and "Open in the generator".
    -   Palette metadata: the artist, record and track name.
    -   Record URL: a URL to bandcamp (or other) where people can also enjoy the record.
6.  That's it! I'll add the palette to the package as soon as I can. Thank you!

## ✍️ Fixing typos

If you spot a typo in the package documentation, you can fix it in the [source file](https://github.com/sophiemeakin/technocolour/blob/main/R/palettes.R). The package uses roxygen to automatically build the .Rd files (documentation), so please don't edit these directly!

## 🐛 Reporting bugs

If something isn't working as it should, please [open an issue](https://github.com/sophiemeakin/technocolour/issues)! Please try to include a [reprex](https://reprex.tidyverse.org/) with a minimal amount of code to reproduce the bug.

## 💭 Anything else

If you have ideas for bigger changes, start by opening an issue and we can chat about if and how to move forward!
