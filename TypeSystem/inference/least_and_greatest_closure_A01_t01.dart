// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - If `S` is `X` where `X` is in `L`:
///   - The least closure of `S` with respect to `L` is `Never`
///   - The greatest closure of `S` with respect to `L` is `Object?`
///
/// @description Check that if `S` is `X` where `X` is in `L`, then the greatest
/// closure of `S` with respect to `L` is `Object?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class C<X> {}

test<X extends C<X>, Y extends C<Y>>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<C<Object?>>>();
}

main() {
  C<Never> c = C<Never>();
  test<C<Never>, C<Never>>(c, c);
}
