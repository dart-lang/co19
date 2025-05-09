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
/// @description Checks that a variable is promoted after the type test in one
/// of the branches, then is is not promoted in another branch and after it.
/// Test type `dynamic`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1() {
  Object? s = 2 > 1 ? "a" : null;
  if (s is dynamic) { // ignore: unnecessary_type_check
  } else {
    s.expectStaticType<Exactly<Object?>>();
  }
  s.expectStaticType<Exactly<Object?>>();
}

test2() {
  Object? s = 1 > 2 ? null: "a";
  if (s is! dynamic) { // ignore: unnecessary_type_check
    s.expectStaticType<Exactly<Object?>>();
  } else {
  }
  s.expectStaticType<Exactly<Object?>>();
}


main() {
  test1();
  test2();
}
