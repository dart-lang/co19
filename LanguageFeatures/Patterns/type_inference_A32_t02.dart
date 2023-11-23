// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// If p with required type T is in an irrefutable context:
/// - It is a compile-time error if M is not assignable to T.
/// - Else if M is not a subtype of T then an implicit coercion or cast is
///   inserted before the pattern binds the value, tests the value's type,
///   destructures the value, or invokes a function with the value as a target
///   or argument.
///
/// @description Check that it is a compile-time error if `M` is not assignable
/// to `T` in irrefutable context. Test list patterns
/// @author sgrekhov22@gmail.com

main() {
  var <int>[x1, num x2] = <num>[1, 2];
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final <num>[x3, num x4] = <Object>["42", true];
//                          ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var <int>[x5, int x6] = <int?>[1, 2 as num];
//                        ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var <int>[int x7, x8] = <dynamic>[42, 3.14];
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  final <int>[x9, x10] = <dynamic>[42, 3.14];
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}
