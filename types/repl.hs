module Repl where
{- by convention, module names are capitalized, func + var names are camelCase
-}

{-
A file can be loaded into `stack repl` using `:load repl.hs`
You can reflect the docs of a function using `:info` in repl mode.
`:info` can also tell you operator precedence as well;  `:info (+)`
will tell you (in addition to the type signature) hat it's `infixl 6 +`,
meaning it's an infix operator that is left associative w/ precedence 6 (higher number eval first).
(Whereas `:info (^)` is `infixr 8 ^`)
so:
2 * 3 * 4 == (2 * 3) * 4
2 ^ 3 ^ 4 == 2 ^ (3 ^ 4)
   
  haskell evaluates expressions lazily; it doesn't reduce an expression down to a value
  until it is forced to. (this enables order of declaration in src files to not matter; since
  all top level declarations should be read into context before any expressions need evalutaion)

  operators (or infix functions) are funcs that can be called with one parameter to its left.
  You can use infix operators prefix style by wrapping in parens: `(+) 2 2`
-}

sayHi :: String -> IO ()
sayHi x =
  putStrLn ("Hello, " ++ x ++ "!")

{-| This function blows
-}
blow :: String -> IO ()
blow x =
  putStrLn ("WHOOOSH! " ++ x ++ " got blown away")

{- whitespace is significant in haskell. use spaces, not tabs, for indentation.
This is because whitespace can indicate a function call.
-}

foo x =
  let
    -- by convention, blocks like this should share an indentation level
    y = 2 * x
    z = x ^ 2
  in
  x - z

{- Arithmetic ops in haskell:
+ --addition
- --subtraction
* --multiplication
/ --fractional division (results in Flaot)
div --integer division, rounds down [(div 3 (-7)) == -1]
quot --integer division, rounds toward 0 [(quot 3 (-7)) == 0]
mod --remainder after modular division [(mod 5 (-7)) == -2]
rem --remainder after division [(rem 5 (-7)) == 5]

diff between mod and rem:
if one of the 2 operands is negative, the result of mod will have the
same sign as the divisor, whereas rem will have the same sign as the dividend.

the word operators can be used infix using backticks: "3 `div` 2"

You can use "sectioning" to create function partials with operators.
2 + 3 == (2+) 3 == (+2) 3 == (+) 2 3
But with operand you curry matters;
(1/) 2 == 0.5
(/1) 2 == 2.0
All the operators can do this (except `-` becuare negatives)

negative numbers can be challenging for the parser to make sense of when they are mixed
in with other operators and numbers. so you need to wrap in parens, or use the unsugared `negate` operator.
[(-3) == (negate 3)]
-}

{-
The `$` operator is like left pipe. I basically makes it so you dont need as many parens.
  The `#` operator is right pipe.
-}


