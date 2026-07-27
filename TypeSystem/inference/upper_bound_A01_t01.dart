// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We write `UP(T0, T1)` for the upper bound of `T0` and `T1` and
/// `DOWN(T0, T1)` for the lower bound of `T0` and `T1`. This extends to type
/// schema as follows:
/// - We add the axiom that `UP(T, _) == T` and the symmetric version.
/// - We replace all uses of `T1 <: T2` in the `UP` algorithm by `S1 <: S2`
///   where `Si` is the least closure of `Ti` with respect to `_`.
/// - We add the axiom that `DOWN(T, _) == T` and the symmetric version.
/// - We replace all uses of `T1 <: T2` in the `DOWN` algorithm by `S1 <: S2`
///   where `Si` is the greatest closure of `Ti` with respect to `_`.
///
/// @description Check that the subtyping algorithm takes the least/greatest
/// closure into account.
/// @author sgrekhov22@gmail.com
/// @issue 63883

import '../../Utils/static_type_helper.dart';

class C<X> {
  C(void Function(X) x);
}
T check<T>(C<List<T>> f) {
  return 42 as T;
}

void main() {
  var x = check(C((List<int> x) {})); // Should infer `int` for `T`
  x.expectStaticType<Exactly<int>>();
}
