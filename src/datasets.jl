using DataFrames
const OPENITI_DB = joinpath(@__DIR__, "../db")
"""
    OpenITIDB(url::String)

Instantiate OpenITIDB type using `url` as input.
"""
mutable struct OpenITIDB
    url::String
end

"""
    OpenITIDB(urls::Array{String})

Instantiate OpenITIDB type using multiple `urls` as input.
"""
function OpenITIDB(urls::Array{String})
    return [OpenITIDB(url) for url in urls]
end
"""
    delete!(::Type{OpenITIDB})

Delete the DB folder used for saving the downloaded OpenITIDB text books
"""
function Base.delete!(::Type{OpenITIDB})
    try
        @info "DB successfully deleted."
        rm(OPENITI_DB, recursive=true)
    catch 
        @info "Skipping: Skipping deletion of DB since it does not exists."
    end
end

"""
    delete!(::Type{OpenITIDB}, row::Int64)

Delete a particular book file using input `row` as identifier from list of books
that can be viewed using `list(OpenITIDB)`
"""
function Base.delete!(::Type{OpenITIDB}, row::Int64)
    books = list(OpenITIDB)
    try
        tree = genpath(books, row)
        file = joinpath(@__DIR__, "../db", join(tree, "/"))
        rm(file, recursive=true)
        @info "File successfully deleted."
    catch 
        @info "Skipping: Skipping deletion of the text book since it does not exists."
    end
end
"""
    get(::Type{OpenITIDB}, url::String)

Download the OpenITI data.
"""
function Base.get(::Type{OpenITIDB}, url::String)
    download(OpenITIDB(url))
end

function Base.download(openiti::OpenITIDB)
    try
        mkdir(OPENITI_DB)
    catch end
    url_parts = split(openiti.url, "/")
    ah_folder = joinpath(OPENITI_DB, url_parts[5])
    try mkdir(ah_folder) catch end
    try mkdir(joinpath(ah_folder, "data")) catch end
    
    author_folder = joinpath(ah_folder, "data", url_parts[8])
    try mkdir(author_folder) catch end

    book_folder = joinpath(author_folder, url_parts[9])
    try mkdir(book_folder) catch end

    version = string(url_parts[10], ".txt")
    file = joinpath(book_folder, version)

    if check_book(book_folder, version)
        @info "File $version already exists, no need to download. To force download, run delete!(OpenITIDB) to delete all the DB and download again."
    else
        HTTP.download(openiti.url, file)
    end
end

function check_book(book_folder::String, filename::String)
    versions = readdir(book_folder)
    files = findall(x -> x == filename, versions)
    return length(files) == 0 ? false : true
end

"""
    get(::Type{OpenITIDB}, url::Array{String})

Download multiple OpenITI books using multiple urls through `Array{String}`.
"""
function Base.get(::Type{OpenITIDB}, url::Array{String})
    download(OpenITIDB(url))
end

function Base.download(openitis::Array{OpenITIDB})
    for openiti in openitis
        download(openiti)
    end
end

"""
    list(::Type{OpenITIDB})

List all the downloaded OpenITI text books
"""
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

"""
    load(::Type{OpenITIDB}, row::Int64)

Load the downloaded OpenITI data by specifying the row of the file
in the output of `list(OpenITIDB)`.
"""
function load(::Type{OpenITIDB}, row::Int64)
    books = list(OpenITIDB)
    try
        tree = genpath(books, row)
        file = joinpath(@__DIR__, "../db", join(tree, "/"))
        return readlines(file)
    catch
        throw("Row number is not in the data frame.")
    end
end

function genpath(books::DataFrame, row::Int64)
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
    return tree
end