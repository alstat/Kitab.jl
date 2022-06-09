using Documenter
using Kitab

makedocs(
    sitename = "Kitab.jl",
    format = Documenter.HTML(
        assets = ["assets/favicon.ico"]
    ),
    authors = "Al-Ahmadgaid B. Asaad",
    modules = [Kitab],
    pages = [
        "Home" => "index.md",
        "API" => "api.md",
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/alstat/Kitab.jl.git"
)