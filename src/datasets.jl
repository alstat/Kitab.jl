using DataFrames
const OPENITI_DB = joinpath(@__DIR__, "../db")

mutable struct OpenITIDB
    url::String
    dest::String
end

function OpenITIDB(url::String) 
    try
        mkdir(OPENITI_DB)
    catch end
    return OpenITIDB(url, OPENITI_DB)
end

function Base.delete!(::Type{OpenITIDB})
    try
        rm(OPENITI_DB, recursive=true)
    catch end
end

function Base.download(openiti::OpenITIDB)
    url_parts = split(openiti.url, "/")
    ah_folder = joinpath(OPENITI_DB, url_parts[5])
    try mkdir(ah_folder) catch end
    try mkdir(joinpath(ah_folder, "data")) catch end
    
    author_folder = joinpath(ah_folder, "data", url_parts[8])
    try mkdir(author_folder) catch end

    book_folder = joinpath(author_folder, url_parts[9])
    try mkdir(book_folder) catch end

    file = joinpath(book_folder, string(url_parts[10], ".txt"))

    HTTP.download(openiti.url, file)
end

mutable struct DB
    type::Symbol
end

function list(::Type{OpenITIDB})
    folder = joinpath(@__DIR__, "../db")
    
    ah = []
    authors = []
    books = []
    versions = []
    for f in readdir(folder)
        ath_files = readdir(joinpath(folder, f, "data"))
        for a in ath_files
            bk_files = readdir(joinpath(folder, f, "data", a))
            for b in bk_files
                vrsn_files = readdir(joinpath(folder, f, "data", a, b))
                push!(versions, vrsn_files)
                push!(books, repeat([b], outer=length(vrsn_files)))
                push!(authors, repeat([a], outer=length(vrsn_files)))
                push!(ah, repeat([f], outer=length(vrsn_files)))
            end
        end
    end

    ah = vcat(ah...)
    authors = vcat(authors...)
    books = vcat(books...)
    versions = vcat(versions...)

    df = DataFrame(Dict(:AH => ah, :Author => authors, :Book => books, :Version => versions))
    return df
end

function load(::Type{OpenITIDB}, row::Int64)
    books = list(OpenITIDB)
    try
        book = books[row, :]
        folders = values(book)
        tree = []
        for i in 1:length(folders)
            if i == 2
                push!(tree, "data")
                push!(tree, folders[i])
            else
                push!(tree, folders[i])
            end
        end
        file = joinpath(@__DIR__, "../db", join(tree, "/"))
        return readlines(file)
    catch
        throw("Row number is not in the data frame.")
    end
end