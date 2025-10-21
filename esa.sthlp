{smcl}
{* *! version 0.1.1 19Oct2025}{...}
{vieweralsosee "[R] estimate" "help estimates"}{...}
{vieweralsosee "[R] estimate store" "help estimates store"}{...}
{vieweralsosee "[R] estadd" "help estadd"}{...}
{vieweralsosee "[R] esttab" "help esttab"}{...}
{vieweralsosee "[R] estout" "help estout"}{...}
{vieweralsosee "" "--"}{...}
{viewerjumpto "Syntax" "esa##syntax"}{...}
{viewerjumpto "Example" "esa##example"}{...}
{title:Title}

{p2colset 5 12 12 2}{...}
{p2col :{hi:esa} {hline 2}}Estimates store with estadd (require {help esttab}){p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}
{p 8 14 4}{cmd:esa} {it:model_name} , [{opt l:eft(left1, left2, ...)} {opt r:ight(right1, right2, ...)} {opt t:ype(l|s|m)} {opt p:arse(string)}]

{synoptset 35 tabbed}{...}
{synopthdr}
{synoptline}
{syntab: Main}
{synopt: {it:model_name}}Model name, such as m1, m2, ...{p_end}

{syntab: Other options}
{synopt: {opt l:eft(left1, left2, ...)}}The left side for {help estadd}, splited by "," or specified parser using {opt parse} option. For example, estadd local {it:left#} = right#. Need a one-to-one correspondence with {opt right} and {opt type}.{p_end}

{synopt: {opt r:ight(right1, right2, ...)}}The right side for {help estadd}, splited by "," or specified parser using {opt parse} option. For example, estadd local left# = {it:right#}. Need a one-to-one correspondence with {opt left} and {opt type}.{p_end}

{synopt: {opt t:ype(l|s|m)}}Types specified for {help estadd}. Do not split. {it:l} for local, {it:s} for scalar, and {it:m} for matrix. For example, {opt type(ls)} means left/right1 is a {help local} and left/right2 is a {help scalar}. Need a one-to-one correspondence with {opt left} and {opt right}.{p_end}

{synopt: {opt p:arse(string)}}Specify a parser for {opt left} and {opt right} options. Default parser is ",". If your {help local} contains ",", you can specify ";" or other parsers.{p_end}
{synoptline}
{p2colreset}{...}

{marker example}{...}
{title:Example}
{hline}
{pstd}Quick use{p_end}
{phang2}{cmd:. webuse nlswork}{p_end}
{phang2}{cmd:. xtreg ln_w ttl_exp age tenure not_smsa south i.year, fe cluster(idcode)}{p_end}
{phang2}{cmd:. esa m1     // same as "est store m1"}{p_end}

{pstd}Add local/scalar/matrix before using esttab{p_end}
{phang2}{cmd:. webuse nlswork}{p_end}
{phang2}{cmd:. xtreg ln_w ttl_exp age tenure not_smsa south i.year, fe cluster(idcode)}{p_end}
{phang2}{cmd:. esa m1, l(ID_FE, YEAR_FE) r(YES, YES) t(ll)}{p_end}
{phang2}{cmd:. // same as the following commands}{p_end}
{phang2}{cmd:. // estadd local ID_FE = "YES"}{p_end}
{phang2}{cmd:. // estadd local YEAR_FE = "YES"}{p_end}
{phang2}{cmd:. // est store m1}{p_end}
{phang2}{cmd:. }{p_end}
{phang2}{cmd:. esttab m1 using "demo.rtf", replace ///}{p_end}
{phang2}{cmd:. b(%20.4f) t(%20.4f) ///}{p_end}
{phang2}{cmd:. scalars(ID_FE YEAR_FE N r2_a) sfmt(%5s %5s %20.0fc %20.4f) ///}{p_end}
{phang2}{cmd:. keep(ttl_exp age tenure not_smsa south) ///}{p_end}
{phang2}{cmd:. order(ttl_exp age tenure not_smsa south) ///}{p_end}
{phang2}{cmd:. title("Regression Resuilts") ///}{p_end}
{phang2}{cmd:. substitute("#c." "×" "c." "" "_cons" "Constant" ///}{p_end}
{phang2}{cmd:. "r2_a" "Adj. R2" "r2_p" "Pse. R2" "r2" "R2" "_" " ") ///}{p_end}
{phang2}{cmd:. nogaps nonotes noobs compress}{p_end}
{hline}

{marker author}{...}
{title:Author}

{pstd}公众号：凯恩斯学计量{p_end}

{phang}{p_end}
