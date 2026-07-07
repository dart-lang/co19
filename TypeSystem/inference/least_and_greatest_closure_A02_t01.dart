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
/// @description Check that the least closure of `S` with respect to `L` is
/// `Never`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class C<X> {}

test<X extends C<X>, Y extends C<Y>>(void Function(X) x, void Function(Y) y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

main() {
  void Function(C<Never>) c = (C<Never> _) {};
  test<C<Never>, C<Never>>(c, c);
}
