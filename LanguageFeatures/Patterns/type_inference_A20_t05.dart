// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
///
/// Logical-or and logical-and: Type check each branch using M as the matched
/// value type.
///
/// @description Check that it is a compile-time error if any branch of a
/// logical-and pattern fails a type check in an irrefutable context. Test the
/// case when context type schema of logical-and pattern is `Never`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

Never foo() => throw 42;

main() {
  var (List<int> v1 && Map<String, num> v2) = <num>[];
//                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (List<int> v3 && Map<String, num> v4) = <String, num>{};
//                                              ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (List<int> v5 && Map<String, num> v6) = foo(); // No error
}
