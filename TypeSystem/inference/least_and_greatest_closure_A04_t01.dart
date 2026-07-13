// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - If `S` is a base type (or in general, if it does not contain any variable
///   from `L`)
///   - The least closure of `S` is `S`
///   - The greatest closure of `S` is `S`
///
/// @description Check that if `S` is a base type then the least closure of `S`
/// is `S`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test<X extends void Function(int), Y extends void Function(int)>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(int)>>();
}

main() {
  test((int _) {}, (int _) {});
}
