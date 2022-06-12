# Kitab.jl <img src="docs/src/assets/logo.svg" align="right" width="100"/>
[![CI](https://github.com/alstat/Kitab.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/alstat/Kitab.jl/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/alstat/Kitab.jl/branch/master/graph/badge.svg?token=2HHbK1FfxT)](https://codecov.io/gh/alstat/Kitab.jl)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/alstat/Kitab.jl/blob/master/LICENSE)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://alstat.github.io/Kitab.jl/dev/)

Kitab.jl is an interface to the [Open Islamic Texts Initiative (OpenITI)](https://openiti.org/) data. The OpenITI is a multi-institutional effort led by researchers at the [Aga Khan University’s Institute for the Study of Muslim Civilisations](https://www.aku.edu/ismc/Pages/home.aspx) in London, [Roshan Institute for Persian Studies at the University of Maryland](https://sllc.umd.edu/fields/persian#:~:text=Roshan%20Institute%20for%20Persian%20Studies%20has%20played%20a%20leading%20role,in%20the%20D.C.%20metro%20area.), College Park, and [Universität Hamburg](https://www.uni-hamburg.de/en.html) that aims to develop the digital infrastructure for the study of Islamicate cultures. 

At a high-level, Kitab.jl aims to fill the gap of doing Islamicate Digital Humanities in Julia. Currently, studying Qur'an using Julia is now accessible through [QuranTree.jl](https://alstat.github.io/QuranTree.jl/stable/), and analysis via Arabic Natural Language Processing (ANLP) is now provided by [Yunir.jl](https://alstat.github.io/Yunir.jl/stable/). Therefore, relating pre-modern Islamicate texts to the Qur'an is now possible with Kitab.jl.

Kitab.jl therefore provides APIs for downloading, listing, and loading the said OpenITI text data. Tools for analyzing the processed data by Kitab.jl are then provided by [Yunir.jl](https://alstat.github.io/Yunir.jl/stable/).

We have to emphasize that, another user of the OpenITI texts is the [KITAB (Knowledge, Information Technology, & the Arabic Book) project](https://kitab-project.org/), which provides a digital tool-box and a forum for discussions about Arabic texts. KITAB project wish to empower users to explore Arabic texts in completely new ways and to expand the frontiers of knowledge about one of the world’s largest and most complex textual traditions.

Kitab.jl is therefore somewhat similar to KITAB project, as both uses OpenITI as their main source for Arabic text books, and both aims to provide tools for analyzing the said texts. You might want to check out the interesting use-cases in KITAB project [blog posts](https://kitab-project.org/blogs). However, Kitab.jl is independently developed but takes inspiration from KITAB project as well.

Lastly, _kitab_ (کتاب) /kitāb/ is the Arabic word for _"book."_ The logo is a Kufic calligraphy of the Arabic word کتاب.

## Installation
To install the package, run the following:
```julia
julia> using Pkg
julia> Pkg.add("Kitab")
```