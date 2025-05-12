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
/// @description Checks that if a variable is promoted after the type test in
/// one of the branches, then is is not promoted in another branch and after it.
/// Test type `Never`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1() {
  String? s = 1 > 2 ? null : "a";
  if (s is Never) {
    s.expectStaticType<Exactly<String?>>(); // Dead code and no promotion.
  } else {
    s.expectStaticType<Exactly<String?>>();
  }
  s.expectStaticType<Exactly<String?>>();
}

test2() {
  String? s = 1 > 2 ? null : "a";
  if (s is! Never) {
    s.expectStaticType<Exactly<String?>>();
  } else {
    s.expectStaticType<Exactly<String?>>(); // Dead code and no promotion.
  }
  s.expectStaticType<Exactly<String?>>();
}


main() {
  test1();
  test2();
}
