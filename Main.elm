module Main exposing (main)

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements exposing (body, li)
import Html exposing (Html)
import Html.CssHelpers


{-| In this template, define your desired HTML here in `page`.  There is a `main` defined
at the bottom of this file that uses `page` and attaches the compiled Elm CSS.
-}
page : Html msg
page =
    Html.div [ id Page ]
        [ Html.div [ class [ NavBar ] ] [ Html.text "navbar text" ]
        , Html.p [] [ Html.text "paragraph text" ]
        ]


{-| Define the Elm CSS classes you want to use
-}
type CssClasses
    = NavBar


{-| Defined any HTML IDs you want to use.  (You should probably use classes above instead.)
-}
type CssIds
    = Page


css : Stylesheet
css =
    (stylesheet << namespace "Main-")
        [ body
            [ overflowX auto
            , minWidth (px 1280)
            ]
        , (#) Page
            [ backgroundColor (rgb 200 128 64)
            , color (hex "CCFFFF")
            , width (pct 100)
            , height (pct 100)
            , boxSizing borderBox
            , padding (px 8)
            , margin zero
            ]
        , (.) NavBar
            [ margin zero
            , padding zero
            , fontSize (px 24)
            , fontFamily sansSerif
            , children
                [ li
                    [ (display inlineBlock) |> important
                    , color primaryAccentColor
                    ]
                ]
            ]
        ]


primaryAccentColor : Color
primaryAccentColor =
    hex "ccffaa"



-- -- --
-- -- --
-- -- --  Everything below here is boilerplate code to set up Elm CSS
-- -- --
-- -- --


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Main-"


attachElmCssStyles : Html msg
attachElmCssStyles =
    Html.CssHelpers.style <| .css <| Css.compile [ css ]


main : Html msg
main =
    Html.div []
        [ attachElmCssStyles
        , page
        ]
