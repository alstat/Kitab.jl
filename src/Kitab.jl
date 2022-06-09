module Kitab
using HTTP

include("datasets.jl")
include("utils.jl")

export extract, delete!, download, list, load
export MetaData, OpenITIDB

end # module
