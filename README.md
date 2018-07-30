# Knowledge-cards LaTeX class

Quick reference cards with a beautiful format and QR code on the back.
There are several color-coded categories (which can be extended).
Each card is two pages long and print-ready.

## Installation

Installation requires simply 
that you copy `knowledge-cards.cls` to your LaTeX project directory.
You can also choose to install the class in your TeX tree. To do so, follow 
the instructions of your specific LaTeX distribution.

### Dependencies

The `knowledge-cards.cls` class is a custom subclass of [`tufte-latex`](https://ctan.org/pkg/tufte-latex); this class and its dependencies need
to be available in your system.

Additional packages used by `knowledge-cards` are: `inputenc`, `datetime2`,
`titlecaps`, `enumitem`, `tikz`, `qrcode`, `amsmath`, `amsfonts`, `amssymb`, 
`mathabx`, `siunitx`, `bm`.

## Usage

The usage of the class is documented in the `knowledge-cards.pdf` document,
which can be compiled from `knowledge-cards.tex`.
 
![knowledge-cards](/figs/knowledge-cards.png)

## Contributing

If you have any comments for improvement or
are interested in contributing to the continued
development of this or any of our other codes, you can contact us through
[Mario's website](http://mariomerino.uc3m.es/).

## License

Copyright (c) 2018 Mario Merino.
This LaTeX class is released as 
open source under the [MIT License](LICENSE.md).