part of Expect;

typedef F<X> = void Function<Y extends X>();

typedef expected_target=Function<X>();

// Function to check nnbd_top_merge features, etc.
class A<T> { T Function(T) get f => (x) => x; }

// Functions for correct type comparison in language feature tests
F<X>? toF<X>(X x) => null;
Type typeOf<X>() => X;
