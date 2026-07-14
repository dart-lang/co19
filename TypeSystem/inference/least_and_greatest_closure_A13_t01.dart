// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is`T Function<X0 extends B0, ..., Xk extends Bk>(T0 x0, ..., Tn xn,
///   [Tn+1 xn+1, ..., Tm xm])` and no type variable in `L` occurs in any of the
///   `Bi`:
///   - The least closure of `S` with respect to `L` is
///     `U Function<X0 extends B0, ..., Xk extends Bk>(U0 x0, ..., Un1 xn,
///     [Un+1 xn+1, ..., Um xm])` where:
///     - `U` is the least closure of `T` with respect to `L`.
///     - `Ui` is the greatest closure of `Ti` with respect to `L`.
///     - with the usual capture avoiding requirement that the `Xi` do not
///       appear in `L`.
///   - The greatest closure of `S` with respect to `L` is
///     `U Function<X0 extends B0, ..., Xk extends Bk>(U0 x0, ..., Un1 xn,
///     [Un+1 xn+1, ..., Um xm])` where:
///     - `U` is the greatest closure of `T` with respect to `L`
///     - `Ui` is the least closure of `Ti` with respect to `L`
///     - with the usual capture avoiding requirement that the `Xi` do not
///       appear in `L`.
///
/// @description Check that if `S` is
/// `T Function<X0 extends B0, ..., Xk extends Bk>(T0 x0, ..., Tn xn,
/// [Tn+1 xn+1, ..., Tm xm])` then the greatest closure of `S` with respect to
/// `L` is `U Function<X0 extends B0, ..., Xk extends Bk>(U0 x0, ..., Un1 xn,
/// [Un+1 xn+1, ..., Um xm])` where `U` is the greatest closure of `T` and `Ui`
/// is the least closure of `Ti`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1<X extends X Function(int, [num]), Y extends Y Function(int, [num])>(
  X x,
  Y y,
) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<Object? Function(int, [num])>>();
}

test2<X extends void Function(X, [X]), Y extends void Function(Y, [Y])>(
  X x,
  Y y,
) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Never, [Never])>>();
}

main() {
  print(test1);
  print(test2);
}
