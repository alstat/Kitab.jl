const OPENITI_DB = joinpath(@__DIR__, "../db")

mutable struct OpenITIDB
    url::String
    dest::String
end

function OpenITIDB(url::String) 
    mkdir(OPENITI_DB)
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
    mkdir(ah_folder)
    mkdir(joinpath(ah_folder, "data"))
    
    author_folder = joinpath(ah_folder, "data", url_parts[8])
    mkdir(author_folder)

    book_folder = joinpath(author_folder, url_parts[9])
    mkdir(book_folder)

    file = joinpath(book_folder, string(url_parts[10], ".txt"))

    HTTP.download(openiti.url, file)
end

mutable struct DB
    type::Symbol
end

function list(db::DB)
    if db.type === :ah
        return readdir(joinpath(@__DIR__, "../db"))
    elseif db.type === :authors
        out = Dict{String,Vector{String}}()
        folder = joinpath(@__DIR__, "../db")
        for f in readdir(folder)
            out[f] = readdir(joinpath(folder, f, "data"))
        end
        return out
    elseif db.type === :books
        out1 = Dict{String,Dict{String,Vector{String}}}()
        out2 = Dict{String,Vector{String}}()
        folder = joinpath(@__DIR__, "../db")
        for f in readdir(folder)
            authors = readdir(joinpath(folder, f, "data"))
            for a in authors
                out2[a] = readdir(joinpath(folder, f, "data", a))
                out1[f] = out2
            end
        end
        return out1
    elseif db.type === :book_versions
        out1 = Dict{String,Dict{String,Dict{String,Vector{String}}}}()
        out2 = Dict{String,Dict{String,Vector{String}}}()
        out3 = Dict{String,Vector{String}}()
        folder = joinpath(@__DIR__, "../db")
        for f in readdir(folder)
            authors = readdir(joinpath(folder, f, "data"))
            for a in authors
                books = readdir(joinpath(folder, f, "data", a))
                for v in books
                    out3[v] = readdir(joinpath(folder, f, "data", a, v))
                    out2[a] = out3
                    out1[f] = out2
                end
            end
        end
        return out1
    else
        throw("Unknown input type, choices are :ah, :author, :books")
    end
end

function load(book::String)

end