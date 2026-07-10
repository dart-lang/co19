// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is `T?`
///   - The least closure of `S` with respect to `L` is `U?` where `U` is the
///     least closure of `T` with respect to `L`
///   - The greatest closure of `S` with respect to `L` is `U?` where `U` is the
///     greatest closure of `T` with respect to `L`
///
/// @description Check that if `S` is `T?` then the greatest closure of `S` with
/// respect to `L` is `U?` where `U` is the greatest closure of `T` with respect
/// to `L`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test<X extends num?, Y extends num?>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<num?>>();
}

main() {
  test(3.14, 2);
}
