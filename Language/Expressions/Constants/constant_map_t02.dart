// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// A constant map literal, const <K, V >{k1: v1, ..., kn: vn}, or
/// <K, V >{k1: v1, ..., kn: vn} that occurs in a constant context, is a
/// potentially constant expression. It is further a constant expression if the
/// map literal evaluates to an object.
///
/// @description Checks that it is a compile-time error if in a constant map
/// literal of the form `const <K, V >{k1: v1, ..., kn: vn`, or
/// `<K, V >{k1: v1, ..., kn: vn}`, `K` or `V` are not a constant type
/// expressions
/// @author iefremov

test<T extends num>() {
  const c1 = <T, String>{};
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  print(const <String, T>{});
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
