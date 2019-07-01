module Utils exposing (curry, flip, getFirst, getSecond, pointMap, uncurry)


getFirst : b -> List ( a, b ) -> Maybe a
getFirst b =
    List.filter (\( _, x ) -> x == b)
        >> List.head
        >> Maybe.map Tuple.first


getSecond : a -> List ( a, b ) -> Maybe b
getSecond a =
    List.filter (\( x, _ ) -> x == a)
        >> List.head
        >> Maybe.map Tuple.second


flip : (a -> b -> c) -> b -> a -> c
flip fn a b =
    fn b a


curry : (( a, b ) -> c) -> a -> b -> c
curry fn a b =
    fn ( a, b )


uncurry : (a -> b -> c) -> ( a, b ) -> c
uncurry fn ( a, b ) =
    fn a b


pointMap : (a -> b) -> ( a, a ) -> ( b, b )
pointMap fn =
    Tuple.mapBoth fn fn
