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
/// to `T` in irrefutable context. Test map patterns
/// @author sgrekhov22@gmail.com

main() {
  var <String, int>{"k1": x1,"k2": num x2} = <String, num>{"k1": 1, "k2": 2};
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  final <String, num>{"k1": x3, "k2": num x4} = <String, Object>{"k1": "42", "k2": true};
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  var <String, int>{"k1": x5, "k2": int x6} = <String, int?>{"k1": 1, "k2": 2};
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  final <String, Object?>{"k1": x7, "k2": x8} = <Object, int>{"k1": 1, "k2" as Object: 2};
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  var <String, int>{"k1": x9, "k2": int x10} = <Object, int>{"k1": 1, "k2": 2};
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
