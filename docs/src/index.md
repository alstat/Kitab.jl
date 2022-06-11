# Kitab.jl
[![codecov](https://codecov.io/gh/alstat/Kitab.jl/branch/master/graph/badge.svg?token=2HHbK1FfxT)](https://codecov.io/gh/alstat/Kitab.jl)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/alstat/Kitab.jl/blob/master/LICENSE)

Kitab.jl is an interface to the [Open Islamic Texts Initiative (OpenITI)](https://openiti.org/) data. The OpenITI is a multi-institutional effort led by researchers at the Aga Khan University’s Institute for the Study of Muslim Civilisations in London, Roshan Institute for Persian Studies at the University of Maryland, College Park, and Universität Hamburg that aims to develop the digital infrastructure for the study of Islamicate cultures. It provides APIs for downloading, listing, and loading the text data.

Kitab (کتاب) /kitāb/ is the Arabic word for "book." The logo is a Kufic calligraphy of the Arabic word کتاب.

## Installation
To install the package, run the following:
```julia
julia> using Pkg
julia> Pkg.add("Kitab")
```
## Outline
```@contents
Pages = [
    "metadata.md",
    "data.md",
    "api.md"
]
Depth = 2
```