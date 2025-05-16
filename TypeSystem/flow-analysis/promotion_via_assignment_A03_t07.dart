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
/// @description Checks promotion/demotion with type `Null` as a type of
/// interest.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1() {
  Object? s = "x";
  s as String;
  if (s is Null) {} // ignore: unnecessary_type_check
  s = null;
  s.expectStaticType<Exactly<Object?>>();
}

test2() {
  Object? s = "x";
  s as String;
  if (s is Null) {} // ignore: unnecessary_type_check
  s = 1 > 2 ? "y": null;
  s.expectStaticType<Exactly<Object?>>();
}

test3() {
  Object? s = "x";
  s as String;
  if (s is Null) {} // ignore: unnecessary_type_check
  s = "y";
  s.expectStaticType<Exactly<String>>();
}

main() {
  test1();
  test2();
  test3();
}
