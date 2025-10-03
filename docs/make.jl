using Documenter
using Kitab

makedocs(;
    sitename = "Kitab.jl",
    format = Documenter.HTML(
        assets = ["assets/favicon.ico", "assets/custom.css"],
        repolink = "https://github.com/alstat/Kitab.jl"
    ),
    authors = "Al-Ahmadgaid B. Asaad",
    repo = Remotes.GitHub("alstat", "Kitab.jl"),
    remotes = nothing,
    modules = [Kitab],
    pages = [
        "Home" => "index.md",
        "Data Extraction" => "data.md",
        "MetaData" => "metadata.md",
        "API" => "api.md"
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/alstat/Kitab.jl.git"
)