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
/// of `S`. Test type `void` as `T`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

typedef Void = void;

test1() {
  String s = "a";
  if (s is Void) { // ignore: unnecessary_type_check
    s.expectStaticType<Exactly<String>>(); // No promotion should happen
  }
}

test2() {
  String s = "a";
  if (s is FutureOr<void>) { // ignore: unnecessary_type_check
    s.expectStaticType<Exactly<String>>();
  }
}

test3() {
  Object? s = "a"; // Promoted to `Object`. `void` is not subtype of `Object`
  if (s is Void) { // ignore: unnecessary_type_check
    s.expectStaticType<Exactly<Object>>();
  }
}

main() {
  test1();
  test2();
  test3();
}
