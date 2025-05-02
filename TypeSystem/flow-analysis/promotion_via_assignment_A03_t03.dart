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
/// @description Checks that if `T <: S` and `S <: T` then promotion via
/// assignment is not performed. Test top types.
/// @author sgrekhov22@gmail.com
/// @issue 60620

import '../../Utils/static_type_helper.dart';

typedef Void = void;

test1() {
  Object? v = 1 > 2 ? null : Object();
  if (v is dynamic) {} // ignore: unnecessary_type_check
  v = (1 > 2 ? null : Object()) as dynamic;
  // `Object?` <: `dynamic` and `dynamic` <: `Object?`.
  // Therefore `v` is not promoted to `dynamic`.
  v.testDynamic;
//  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  Object? v = 1 > 2 ? null : Object();
  if (v is Void) {} // ignore: unnecessary_type_check
  v = 1 > 2 ? null : Object(); // can't assign `void`, let's assign subtype of `void`
  // `Object?` <: `void` and `void` <: `Object?`.
  // Therefore `v` is not promoted to `void`.
  v.expectStaticType<Exactly<Object?>>();
}

test3() {
  dynamic d = 42;
  if (d is Object?) {} // ignore: unnecessary_type_check
  d = 1 > 2 ? null: Object();
  d.testDynamic; // `d` should be `dynamic`
}

test4() {
  dynamic d = 42;
  if (d is Void) {} // ignore: unnecessary_type_check
  d = Object();     // can't assign `void`, let's assign subtype of `void`
  // `void` <: `dynamic` and `dynamic` <: `void`.
  // Therefore `d` is not promoted to `void`.
  d.testDynamic;
}

main() {
  test1();
  test2();
  test3();
  test4();
}
