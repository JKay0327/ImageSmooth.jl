if VERSION < v"1.1"
    # newly added in https://github.com/JuliaLang/julia/pull/30630
    function require_one_based_indexing(A...)
        return !Base.has_offset_axes(A...) || throw(
            ArgumentError(
                "offset arrays are not supported but got an array with index other than 1"
            ),
        )
    end
else
    using Base: require_one_based_indexing
end