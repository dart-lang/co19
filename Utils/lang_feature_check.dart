part of Expect;

typedef F<X> = void Function<Y extends X>();

typedef expected_target=Function<X>();

// Functions for correct type comparison in language feature tests
F<X> toF<X>(X x) => null;
Type typeOf<X>() => X;
