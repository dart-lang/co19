// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is `T Function<X0 extends B0, ..., Xk extends Bk>(T0 x0, ..., Tn xn,
///   [Tn+1 xn+1, ..., Tm xm])` or `T Function<X0 extends B0, ...,
///   Xk extends Bk>(T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})` and `L`
///   contains any free type variables from any of the `Bi`:
///   - The least closure of `S` with respect to `L` is `Never`
///   - The greatest closure of `S` with respect to `L` is `Function`
///
/// @description Check that if `S` is
/// `T Function<X0 extends B0, ..., Xk extends Bk>(T0 x0, ..., Tn xn,
/// {Tn+1 xn+1, ..., Tm xm})` and `L` contains any free type variables from any
/// of the `Bi` then the least closure of `S` with respect to `L` is
/// `Never`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1<
  X extends void Function(void Function<T extends X>(int, {num n})),
  Y extends void Function(void Function<T extends Y>(int, {num n}))
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

test2<
  X extends void Function(
    void Function<T1 extends X, T2 extends num>(int, {num n}),
  ),
  Y extends void Function(
    void Function<T1 extends Y, T2 extends num>(int, {num n}),
  )
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

main() {
  print(test1);
  print(test2);
}
