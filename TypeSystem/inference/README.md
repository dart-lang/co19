Some tests in this directory (in particular, `least_and_greatest_closure_A*.dart`) 
check the least and greatest closure of a type. To do this, we examine the results 
of the [UP](https://github.com/dart-lang/language/blob/main/resources/type-system/upper-lower-bounds.md#upper-bounds) 
and [DOWN](https://github.com/dart-lang/language/blob/main/resources/type-system/upper-lower-bounds.md#lower-bounds) 
functions. However, we need to be careful because these functions may return a type 
that was not produced by the least/greatest closure computation itself.

The least and greatest closure of type is [defined](https://github.com/dart-lang/language/blob/main/resources/type-system/inference.md#type-variable-elimination-least-and-greatest-closure-of-a-type)
with respect to a set of type variables. Therefore, each test that verifies this 
behavior must involve at least two type variables. However, the definitions of 
`UP` and `DOWN` include the following rules:

- `UP(T1, T2) = T2` if `T1 <: T2`
- `UP(T1, T2) = T1` if `T2 <: T1`
...
- `DOWN(T1, T2) = T1` if `T1 <: T2`
- `DOWN(T1, T2) = T2` if `T2 <: T1`

This means that the two types must not be subtypes of each other. Otherwise, `UP` and 
`DOWN` will return one of the input types directly, which is not what these tests are 
intended to verify.

Therefore, each test must use two type variables with the same structure (that is, one 
is simply an alpha-conversion of the other), such that neither is a subtype of the 
other. This forces `UP` or `DOWN` to use the rule that computes the least/greatest 
closure on both arguments. As a result, we compute `UP/DOWN(erasedType, erasedType)`, 
which evaluates to `erasedType`, allowing us to inspect the result produced by the 
least/greatest closure algorithm.
