# Kitab.jl <img src="docs/src/assets/logo.svg" align="right" width="100"/>
[![CI](https://github.com/alstat/Kitab.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/alstat/Kitab.jl/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/alstat/Kitab.jl/branch/master/graph/badge.svg?token=2HHbK1FfxT)](https://codecov.io/gh/alstat/Kitab.jl)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/alstat/Kitab.jl/blob/master/LICENSE)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://alstat.github.io/Kitab.jl/dev/)

Kitab.jl is an interface to the [Open Islamic Texts Initiative (OpenITI)](https://openiti.org/) data. The OpenITI is a multi-institutional effort led by researchers at the [Aga Khan University’s Institute for the Study of Muslim Civilisations](https://www.aku.edu/ismc/Pages/home.aspx) in London, [Roshan Institute for Persian Studies at the University of Maryland](https://sllc.umd.edu/fields/persian#:~:text=Roshan%20Institute%20for%20Persian%20Studies%20has%20played%20a%20leading%20role,in%20the%20D.C.%20metro%20area.), College Park, and [Universität Hamburg](https://www.uni-hamburg.de/en.html) that aims to develop the digital infrastructure for the study of Islamicate cultures. Kitab.jl provides APIs for downloading, listing, and loading the said text data.

Kitab (کتاب) /kitāb/ is the Arabic word for "book." The logo is a Kufic calligraphy of the Arabic word کتاب.

## Installation
To install the package, run the following:
```julia
julia> using Pkg
julia> Pkg.add("Kitab")
```