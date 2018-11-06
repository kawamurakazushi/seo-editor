module Example exposing (suite)

-- import Fuzz exposing (Fuzzer, int, list, string)

import Expect exposing (Expectation)
import Main
import Test exposing (..)


suite : Test
suite =
    describe "methods"
        [ describe "Counts chracters"
            [ test "counts perfectly" <|
                \_ ->
                    "abc"
                        |> Main.countCharacters
                        |> Expect.equal 3
            , test "counts empty characters" <|
                \_ ->
                    Main.countCharacters ""
                        |> Expect.equal 0
            , test "ignore \n" <|
                \_ ->
                    Main.countCharacters "hello\nworld\n"
                        |> Expect.equal 10
            ]
        ]
