const META_KEYS = [
    "#META# 001.AuthorNAME",
    "#META# 002.AuthorSHORTNAME",
    "#META# 003.AuthorSHORTNAMEtrans",
    "#META# 004.AuthorBORN",
    "#META# 005.MULTIPLEBIRTHDATES",
    "#META# 006.AuthorDIED",
    "#META# 007.MULTIPLEDEATHDATES",
    "#META# 008.LEGALSCHOOL",
    "#META# 009.LEGALSCHOOLtrans",
    "#META# 010.BookTITLE",
    "#META# 011.BookSHORTTITLE",
    "#META# 012.BookSHORTTITLEtrans",
    "#META# 013.EdPUBLISHER",
    "#META# 014.BookVOLS",
    "#META# 015.BookGENRE",
    "#META# 016.BookGENREtrans",
    "#META# 017.BookGENREEng",
    "#META# 018.RELATIONSHIP",
    "#META# 019.LibURI"
]

mutable struct MetaData
    author::Union{Missing,String}
    author_short_name::Union{Missing,String}
    author_short_name_trans::Union{Missing,String}
    author_born::Union{Missing,Int64}
    multiple_birthdates::Union{Missing,Bool}
    author_died::Union{Missing,Int64}
    multiple_deathdates::Union{Missing,Bool}
    legal_school::Union{Missing,String}
    legal_school_trans::Union{Missing,String}
    book_title::Union{Missing,String}
    book_short_title::Union{Missing,String}
    book_short_title_trans::Union{Missing,String}
    ed_publisher::Union{Missing,String}
    book_vols::Union{Missing,Int64}
    book_genre::Union{Missing,String}
    book_genre_trans::Union{Missing,String}
    book_genre_eng::Union{Missing,String}
    relationship::Union{Missing,String}
    lib_uri::Union{Missing,String}
end
MetaData() = MetaData((missing for _ in 1:19)...)

function extract(data::Array{String})
    try 
        return string(strip(split(data[1], "::")[2])) 
    catch 
        try
            return string(strip(split(data[1], ":")[2])) 
        catch
            return missing
        end
    end
end

function extract(data::Array{String}, type::String)
    raw = filter(x -> occursin(type, x), data)
    return extract(raw)
end

function extract(::Type{MetaData}, data::Array{String})
    meta = []
    for k in META_KEYS
	    push!(meta, extract(data, k))
    end

    meta_tuple = Tuple(meta)
	
	return MetaData(meta_tuple...)
end