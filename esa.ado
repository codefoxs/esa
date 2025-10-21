*! version 0.1.1 19Oct2025: Estimates store with estadd

cap program drop esa
program define esa
    syntax anything, [Left(string) Right(string) Type(string) Parse(string)]
    
    if "`left'" != ""{
        if "`parse'" == ""{
            local parse = ","
        }
        
        local addnum = strlen("`type'")
        
        forvalue i = 1(1)`addnum'{
            if substr("`type'", `i', 1) == "l"{
                gettoken _left left: left, parse("`parse'")
                gettoken _right right: right, parse("`parse'")
                qui estadd local `_left' = "`_right'"
                dis as res "ESA: estadd local `_left' with `_right'"
            }
            else if substr("`type'", `i', 1) == "s"{
                gettoken _left left: left, parse("`parse'")
                gettoken _right right: right, parse("`parse'")
                qui estadd scalar `_left' = `_right'
                dis as res "ESA: estadd scalar `_left' with `_right'"
            }
            else if substr("`type'", `i', 1) == "l"{
                gettoken _left left: left, parse("`parse'")
                gettoken _right right: right, parse("`parse'")
                qui estadd matrix `_left' = `_right'
                dis as res "ESA: estadd matrix `_left' with `_right'"
            }
            else{
                dis as error "ESA: Only support l for local, s for scalar, and m for matrix."
                exit
            }
            gettoken _left left: left, parse("`parse'")
            gettoken _right right: right, parse("`parse'")
        }
    }
    est store `anything'
    dis as res "ESA: est store `anything'"
end