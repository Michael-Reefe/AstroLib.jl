# This file is a part of AstroLib.jl. License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

"""
    sixty(number) -> [deg, min, sec]

### Purpose ###

Converts a decimal number to sexagesimal.

### Explanation ###

The reverse of `ten` function.

### Argument ###

* `number`: decimal number to be converted to sexagesimal.

### Output ###

An array of three `AbstractFloat`, that are the sexagesimal counterpart
(degrees, minutes, seconds) of `number`.

### Example ###

``` julia
julia> sixty(-0.615)
3-element Array{AbstractFloat,1}:
 -0.0
 36.0
 54.0
```

### Notes ###

Code of this function is based on IDL Astronomy User's Library.
"""
# XXX: trailsign keyword not implemented, not sure it's worth the effort.
# Possible strategy: hold the sign of number in a variable (you can use
# copysign(1, number)), set result[1] equal to dd and multiply the first
# non-zero element (use findfirst for that) by the sign of number.
function sixty(number::AbstractFloat)
    dd = trunc(abs(number))
    mm = abs(60.0*number)
    ss = abs(3600.0*number)
    result = zeros(AbstractFloat, 3)
    result[1] = trunc(number)
    result[2] = trunc(mm - 60.0*dd)
    result[3] = ss - 3600.0*dd - 60.0*result[2]
    return result
end

sixty(n::Real) = sixty(float(n))
