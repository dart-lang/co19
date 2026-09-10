Some tests in this directory need to tell apart types that are mutual subtypes, such
as `Object` and `FutureOr<Object>`, or `dynamic`, `Object?`, `FutureOr<Object?>` and
`FutureOr<Object>?`. No subtype-based check can do this: `expectStaticType<Exactly<T>>()`,
assignability and type parameter bounds are all defined in terms of subtyping, and
[NORM](https://github.com/dart-lang/language/blob/main/resources/type-system/normalization.md)
treats `FutureOr<Object>` and `Object` as the same type. The following probes make the
difference visible at compile time.

```dart
Future<X> probeFuture<X>() => Future<X>.value(0 as dynamic);
FutureOr<X> probeFutureOr<X>() => 0 as dynamic;
Future<Future<X>> probeFuture2<X>() =>
    Future<Future<X>>.value(Future<X>.value(0 as dynamic));
Future<FutureOr<X>> probeFutureOr2<X>() => Future<FutureOr<X>>.value(0 as dynamic);
```

Type inference matches the type of a probe against the context type of the invocation.
Because
[subtype constraint generation](https://github.com/dart-lang/language/blob/main/resources/type-system/inference.md#subtype-constraint-generation)
decomposes types syntactically rather than by subtyping, equivalent context types
produce solutions for `X` that are *not* equivalent, and those solutions can be
inspected with `expectStaticType`. A cascade is used so that the assertion is applied to
the probe itself while the enclosing assignment (or argument position) still provides the
context type:

```dart
v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
```

A `dynamic` receiver, on the other hand, accepts any member access, so `v.checkDynamic`
(a getter which is deliberately not declared anywhere) compiles if and only if the static
type of `v` is `dynamic`. Such an access throws `NoSuchMethodError` at run time, so it
has to be guarded:

```dart
if (1 > 2) {
  v.checkDynamic;
}
```

A single probe only looks at the outermost `FutureOr` of the context type, so a probe with
one level of nesting cannot tell `FutureOr<Object>` from `FutureOr<FutureOr<Object>>`: it
infers `X` as `Object` in the first case and as `FutureOr<Object>` in the second, and
those two solutions are again mutual subtypes. Probes with two levels of nesting shift the
inference variable one `FutureOr` deeper, and each of the ten types below then gets a
distinct signature of static checks:

| Static type of `v`            | `v.checkDynamic` | `v.expectStaticType` | `probeFuture()`             | `probeFuture2()`          | `probeFutureOr()`             | `probeFutureOr2()`          |
|-------------------------------|------------------|----------------------|-----------------------------|---------------------------|-------------------------------|-----------------------------|
| `Object`                      | error            | `Exactly<Object>`    | `Future<dynamic>`           | `Future<Future<dynamic>>` | `FutureOr<Object>`            | `Future<FutureOr<dynamic>>` |
| `FutureOr<Object>`            | error            | `Exactly<Object>`    | `Future<Object>`            | `Future<Future<dynamic>>` | `FutureOr<Object>`            | `Future<FutureOr<Object>>`  |
| `FutureOr<FutureOr<Object>>`  | error            | `Exactly<Object>`    | `Future<FutureOr<Object>>`  | `Future<Future<Object>>`  | `FutureOr<FutureOr<Object>>`  | `Future<FutureOr<Object>>`  |
| `Object?`                     | error            | `Exactly<Object?>`   | `Future<dynamic>`           | `Future<Future<dynamic>>` | `FutureOr<Object>`            | `Future<FutureOr<dynamic>>` |
| `FutureOr<Object?>`           | error            | `Exactly<Object?>`   | `Future<Object?>`           | `Future<Future<dynamic>>` | `FutureOr<Object?>`           | `Future<FutureOr<Object>>`  |
| `FutureOr<Object>?`           | error            | `Exactly<Object?>`   | `Future<Object>`            | `Future<Future<dynamic>>` | `FutureOr<Object>`            | `Future<FutureOr<Object>>`  |
| `FutureOr<FutureOr<Object?>>` | error            | `Exactly<Object?>`   | `Future<FutureOr<Object?>>` | `Future<Future<Object?>>` | `FutureOr<FutureOr<Object?>>` | `Future<FutureOr<Object?>>` |
| `FutureOr<FutureOr<Object>?>` | error            | `Exactly<Object?>`   | `Future<FutureOr<Object>?>` | `Future<Future<Object>>`  | `FutureOr<FutureOr<Object>?>` | `Future<FutureOr<Object>>`  |
| `FutureOr<FutureOr<Object>>?` | error            | `Exactly<Object?>`   | `Future<FutureOr<Object>>`  | `Future<Future<Object>>`  | `FutureOr<FutureOr<Object>>`  | `Future<FutureOr<Object>>`  |
| `dynamic`                     | compiles         | not applicable       | `Future<dynamic>`           | `Future<Future<dynamic>>` | `FutureOr<dynamic>`           | `Future<FutureOr<dynamic>>` |

The four probe columns list the types that are actually inferred; any equivalent spelling
passes the corresponding assertion just as well. This is what makes some of the cells
coincide even though they are spelled differently: `Future<Object?>` and `Future<dynamic>`
are mutual subtypes, and so are `FutureOr<Object?>` and `FutureOr<dynamic>`. In
particular, `FutureOr<FutureOr<Object?>>` and `dynamic` have the same signature in all
four probe columns, and `checkDynamic` is the only check that separates them.

The pattern generalizes to deeper nesting: a probe with `k` nested `Future`s infers `X` as
`Object` if and only if the context type has at least `k` nested `FutureOr`s, and
replacing the innermost `Future` with `FutureOr` makes the probe report whether the type
at that level is nullable.

Note that extension members cannot be invoked on a `dynamic` receiver: for a `dynamic`
`v` the call `v.expectStaticType<Exactly<Object?>>()` is a dynamic invocation which
checks nothing statically (and fails at run time), which is why the second column is not
applicable to the last row.
