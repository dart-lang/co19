// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is `(T0 x0, ..., Tn xn,  {Tn+1 xn+1, ..., Tm xm})`:
///   - The least closure of `S` with respect to `L` is
///     `(U0 x0, ..., Un1 xn, {Un+1 xn+1, ..., Um xm})` where:
///     - `Ui` is the least closure of `Ti` with respect to `L`
///   - The greatest closure of `S` with respect to `L` is
///     `(U0 x0, ..., Un1 xn, {Un+1 xn+1, ..., Um xm})` where:
///     - `Ui` is the greatest closure of `Ti` with respect to `L`
///
/// @description Check that if `S` is
/// `(T0 x0, ..., Tn xn,  {Tn+1 xn+1, ..., Tm xm})` then the least closure of
/// `S` with respect to `L` is `(U0 x0, ..., Un1 xn, {Un+1 xn+1, ..., Um xm})`
/// where `Ui` is the greatest closure of `Ti` with respect to `L`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1<X extends void Function((X, {X n})), Y extends void Function((Y, {Y n}))>(
  X x,
  Y y,
) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function((Never, {Never n}))>>();
}

test2<X extends void Function((int, {num? n})), Y extends void Function((int, {num? n}))>(
    X x,
    Y y,
    ) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function((int, {num? n}))>>();
}

main() {
  print(test1);
  print(test2);
}
