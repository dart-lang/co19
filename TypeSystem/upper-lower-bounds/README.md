We define the upper bound of two types T1 and T2 to be **UP**(`T1`,`T2`) as follows.

- **UP**(`T`, `T`) = `T`
- **UP**(`T1`, `T2`) where **TOP**(`T1`) and **TOP**(`T2`) =
  - `T1` if **MORETOP**(`T1`, `T2`)
  - `T2` otherwise
- **UP**(`T1`, `T2`) = `T1` if **TOP**(`T1`)
- **UP**(`T1`, `T2`) = `T2` if **TOP**(`T2`)

- **UP**(`T1`, `T2`) where **BOTTOM**(`T1`) and **BOTTOM**(`T2`) =
  - `T2` if **MOREBOTTOM**(`T1`, `T2`)
  - `T1` otherwise
- **UP**(`T1`, `T2`) = `T2` if **BOTTOM**(`T1`)
- **UP**(`T1`, `T2`) = `T1` if **BOTTOM**(`T2`)

- **UP**(`X1 & B1`, `T2`) =
  - `T2` if `X1 <: T2`
  - otherwise `X1` if `T2 <: X1`
  - otherwise **UP**(`B1a`, `T2`)
    where `B1a` is the greatest closure of `B1` with respect to `X1`,
    as defined in [inference.md].

- **UP**(`T1`, `X2 & B2`) =
  - `X2` if `T1 <: X2`
  - otherwise `T1` if `X2 <: T1`
  - otherwise **UP**(`T1`, `B2a`)
    where `B2a` is the greatest closure of `B2` with respect to `X2`,
    as defined in [inference.md].

- **UP**(`T1`, `T2`) where **NULL**(`T1`) and **NULL**(`T2`) =
  - `T2` if **MOREBOTTOM**(`T1`, `T2`)
  - `T1` otherwise

- **UP**(`T1`, `T2`) where **NULL**(`T1`) =
  - `T2` if  `T2` is nullable
  - `T2*` if `Null <: T2` or `T1 <: Object` (that is, `T1` or `T2` is legacy)
  - `T2?` otherwise

- **UP**(`T1`, `T2`) where **NULL**(`T2`) =
  - `T1` if  `T1` is nullable
  - `T1*` if `Null <: T1` or `T2 <: Object` (that is, `T1` or `T2` is legacy)
  - `T1?` otherwise

- **UP**(`T1`, `T2`) where **OBJECT**(`T1`) and **OBJECT**(`T2`) =
  - `T1` if **MORETOP**(`T1`, `T2`)
  - `T2` otherwise

- **UP**(`T1`, `T2`) where **OBJECT**(`T1`) =
  - `T1` if `T2` is non-nullable
  - `T1*` if `Null <: T2` (that is, `T2` is legacy)
  - `T1?` otherwise

- **UP**(`T1`, `T2`) where **OBJECT**(`T2`) =
  - `T2` if `T1` is non-nullable
  - `T2*` if `Null <: T1` (that is, `T1` is legacy)
  - `T2?` otherwise

- **UP**(`T1*`, `T2*`) = `S*` where `S` is **UP**(`T1`, `T2`)
- **UP**(`T1*`, `T2?`) = `S?` where `S` is **UP**(`T1`, `T2`)
- **UP**(`T1?`, `T2*`) = `S?` where `S` is **UP**(`T1`, `T2`)
- **UP**(`T1*`, `T2`) = `S*` where `S` is **UP**(`T1`, `T2`)
- **UP**(`T1`, `T2*`) = `S*` where `S` is **UP**(`T1`, `T2`)

- **UP**(`T1?`, `T2?`) = `S?` where `S` is **UP**(`T1`, `T2`)
- **UP**(`T1?`, `T2`) = `S?` where `S` is **UP**(`T1`, `T2`)
- **UP**(`T1`, `T2?`) = `S?` where `S` is **UP**(`T1`, `T2`)

- **UP**(`X1 extends B1`, `T2`) =
  - `T2` if `X1 <: T2`
  - otherwise `X1` if `T2 <: X1`
  - otherwise **UP**(`B1a`, `T2`)
    where `B1a` is the greatest closure of `B1` with respect to `X1`,
    as defined in [inference.md].

- **UP**(`T1`, `X2 extends B2`) =
  - `X2` if `T1 <: X2`
  - otherwise `T1` if `X2 <: T1`
  - otherwise **UP**(`T1`, `B2a`)
    where `B2a` is the greatest closure of `B2` with respect to `X2`,
    as defined in [inference.md].

- **UP**(`T Function<...>(...)`, `Function`) = `Function`
- **UP**(`Function`, `T Function<...>(...)`) = `Function`

- **UP**(`T0 Function<X0 extends B00, ... Xm extends B0m>(P00, ... P0k)`,
  `T1 Function<X0 extends B10, ... Xm extends B1m>(P10, ... P1l)`) =
  `R0 Function<X0 extends B20, ..., Xm extends B2m>(P20, ..., P2q)` if:
  - each `B0i` and `B1i` are equal types (syntactically)
  - Both have the same number of required positional parameters
  - `q` is min(`k`, `l`)
  - `R0` is **UP**(`T0`, `T1`)
  - `B2i` is `B0i`
  - `P2i` is **DOWN**(`P0i`, `P1i`)
- **UP**(`T0 Function<X0 extends B00, ... Xm extends B0m>(P00, ... P0k, Named0)`,
  `T1 Function<X0 extends B10, ... Xm extends B1m>(P10, ... P1k, Named1)`) =
  `R0 Function<X0 extends B20, ..., Xm extends B2m>(P20, ..., P2k, Named2)` if:
  - each `B0i` and `B1i` are equal types (syntactically)
  - All positional parameters are required
  - `Named0` contains an entry (optional or required) of the form `R0i xi`
    for every required named parameter `R1i xi` in `Named1`
  - `Named1` contains an entry (optional or required) of the form `R1i xi`
    for every required named parameter `R0i xi` in `Named0`
  - The result is defined as follows:
    - `R0` is **UP**(`T0`, `T1`)
    - `B2i` is `B0i`
    - `P2i` is **DOWN**(`P0i`, `P1i`)
    - `Named2` contains exactly `R2i xi` for each `xi` in both `Named0` and
      `Named1`
    - where `R0i xi` is in `Named0`
    - where `R1i xi` is in `Named1`
    - and `R2i` is **DOWN**(`R0i`, `R1i`)
    - and `R2i xi` is required if `xi` is required in either `Named0` or
      `Named1`

- **UP**(`T Function<...>(...)`, `S Function<...>(...)`) = `Function` otherwise
- **UP**(`T Function<...>(...)`, `T2`) = **UP**(`Object`, `T2`)
- **UP**(`T1`, `T Function<...>(...)`) = **UP**(`T1`, `Object`)

- **UP**(`(...)`, `Record`) = `Record`
- **UP**(`Record`, `(...)`) = `Record`

- **UP**(`(S0, ... Sk, {T0 d0, ..., Tn dn})`,
  `(S0', ... Sk', {T0' d0, ..., Tn' dn})`) =
  `(Q0, ...,Qk, {R0, ..., Rn})` if:
  - `Qi` is **UP**(`Si`, `Si'`)
  - `Ri` is **UP**(`Ti`, `Ti'`)

- **UP**(`(...)`, `(...)`) = `Record` otherwise
- **UP**(`(...)`, `T2`) = **UP**(`Object`, `T2`)
- **UP**(`T1`, `(...)`) = **UP**(`T1`, `Object`)

- **UP**(`FutureOr<T1>`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = **UP**(`T1`, `T2`)
- **UP**(`Future<T1>`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = **UP**(`T1`, `T2`)
- **UP**(`FutureOr<T1>`, `Future<T2>`) = `FutureOr<T3>` where `T3` = **UP**(`T1`, `T2`)
- **UP**(`T1`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = **UP**(`T1`, `T2`)
- **UP**(`FutureOr<T1>`, `T2`) = `FutureOr<T3>` where `T3` = **UP**(`T1`, `T2`)
- **UP**(`T1`, `T2`) = `T2` if `T1` <: `T2`
  - Note that both types must be class types at this point
- **UP**(`T1`, `T2`) = `T1` if `T2` <: `T1`
  - Note that both types must be class types at this point
- **UP**(`C<T0, ..., Tn>`, `C<S0, ..., Sn>`) = `C<R0,..., Rn>` where `Ri` is **UP**(`Ti`, `Si`)
- **UP**(`C0<T0, ..., Tn>`, `C1<S0, ..., Sk>`) = least upper bound of two
  interfaces as in Dart 1, with modifications for handling mixed null safe and
  legacy code as follows:
  - For an upper bound computation in a legacy library, the set of
    super-interfaces used consists of the `LEGACY_ERASURE` of the
    super-interfaces of the two types.
  - For an upper bound computation in an opted in library, no modification of
    the set of super-interfaces is performed.

[inference.md]: https://github.com/dart-lang/language/blob/master/resources/type-system/inference.md
