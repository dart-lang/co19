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
/// to `T` in irrefutable context. Test record patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

main() {
  var (x1, n: x2) = (1, 2);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  final (x3, n: x4) = ();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  var (x5, n: x6) = (n: "pi");
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  final (x7, n: x8) = (1, m: "pi");
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}
