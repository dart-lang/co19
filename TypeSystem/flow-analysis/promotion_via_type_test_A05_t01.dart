// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via type test with type
/// `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and `captured` is `false`
/// - and `S` is the current type of `x` in `VM`
/// - and not `S <: T`
/// - and `T <: S` or (`S` is `X extends R` and `T <: R`) or (`S` is `X & R` and
///   `T <: R`)
///
/// @description Checks that a variable is not promotable if `T` is not subtype
/// of `S`. Test extension types.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET1(num v) {}
extension type ET2(num v) implements Object {}
extension type ET3(num v) implements num {}

test1(ET1 et) {
  if (et is int) {
    et.expectStaticType<Exactly<ET1>>();
  }
}

test2(ET2 et) {
  if (et is int) {
    et.expectStaticType<Exactly<ET2>>();
  }
}

test3(ET3 et) {
  if (et is int) {
    et.expectStaticType<Exactly<ET3>>();
  }
}

main() {
  test1(ET1(0));
  test2(ET2(0));
  test3(ET3(0));
}
