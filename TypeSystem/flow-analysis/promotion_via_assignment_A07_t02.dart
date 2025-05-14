// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via assignment of an
/// expression of type `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and captured is false
/// - and `S` is the current type of `x` in `VM`
/// - and `T <: S` and not `S <: T`
/// - and `T` is a type of interest for `x` in `tested`
///
/// @description Checks that a variable is not promotable if `T` is not a
/// subtype of `S`. Test extension types.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET1(int v) {}
extension type ET2(int v) implements Object {}
extension type ET3(int v) implements int {}

test1(num o) {
  if (o is ET1) {}
  o = 42;
  o.expectStaticType<Exactly<num>>();
}

test2(num o) {
  if (o is ET2) {}
  o = 42;
  o.expectStaticType<Exactly<num>>();
}

test3(num o) {
  if (o is ET3) {}
  o = 42;
  o.expectStaticType<Exactly<num>>();
}

main() {
  test1(1);
  test2(2);
  test3(3);
}
