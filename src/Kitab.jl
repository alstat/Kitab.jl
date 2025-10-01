module Kitab
using Downloads

include("datasets.jl")
include("utils.jl")

export extract, delete!, get, list, load
export MetaData, OpenITIDB

end # module
