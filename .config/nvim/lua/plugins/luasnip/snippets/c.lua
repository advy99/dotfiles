local function C_SNIPPETS (ls) ls.add("all", {


ls.snip("ifndef", {
	ls.t("#ifndef "), ls.i(1),
	ls.t({ "", "#define " }), ls.f(ls.livecopy, {1}),
	ls.t({ "", "", "", }), ls.i(0),
	ls.t({ "", "", "", "#endif" }),
}),


ls.snip("main", {
	ls.t("int main ("), -- ${1:int argc, char ** argv})
	ls.t({ ")", "{", "\t" }), ls.i(2),
	ls.t({ "", "", "\t return 0;", "}" }),
}),


-- ls.snip("/**", {
-- 	ls.node.t("/**"), ls.node.i(1),
-- 	ls.node.t({ "*", "*" }), ls.node.i(2),
-- 	ls.node.t("*/"),
-- }),


-- snippet /**
-- /** $1
--  *
--  * $2
--  */
-- endsnippet


-- snippet /class
-- /** @class $1
--  *
--  * $2
--  */
-- endsnippet


-- snippet /enum
-- /** @enum $1
--  *
--  * $2
--  */
-- endsnippet


-- snippet /file
-- /** @file $1
--  */
-- endsnippet


-- snippet /fn
-- /** @fn $1
--  *
--  * $2
--  */
-- endsnippet


-- snippet class
-- class ${1:Name}
-- {
-- private:
-- 	$2

-- public:
-- 	$3
-- };
-- endsnippet


-- snippet def
-- #define $1
-- endsnippet


-- snippet for+
-- for (int $1 = 0; $1 < $2; $1++)
-- {
-- 	$3
-- }
-- endsnippet


-- snippet for-
-- for (int $1 = $2; $1 > 0; $1--)
-- {
-- 	$3
-- }
-- endsnippet


-- snippet forit
-- for (auto it = $1.begin(); it != $1.end(); ++it)
-- 	$2
-- endsnippet


-- snippet forcit
-- for (auto it = $1.cbegin(); it != $1.cend(); ++it)
-- 	$2
-- endsnippet


-- snippet i
-- #include "$1"
-- endsnippet


-- snippet it
-- #include <$1>
-- endsnippet




}) end return C_SNIPPETS
