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
/// @description Check that if `M` is not a subtype of `T` then generic function
/// instantiation is not performed and compile-time error occurs
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

T foo<T>(T t) => t;

main() {
  var list = [foo];
  var <T Function<T>(T)>[int Function(int) f1] = list;
//                                         ^^
// [analyzer] unspecified
// [cfe] unspecified
  var <T Function<T>(T)>[int Function(int) fInt &&
//                                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      String Function(String) fString] = list;
//                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final map = {"key1": foo};
  final <String, T Function<T>(T)>{"key1": int Function(int) f2} = map;
//                                                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  var record = (x: foo);
  var (x: int Function(int) f3) = record;
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}
