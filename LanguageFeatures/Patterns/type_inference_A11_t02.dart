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
/// logical-and pattern fails a type check in irrefutable context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  var (List<int> v1 && List<num> v2) = <num>[];
//                                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (List<num> v3 && List<int> v4) = <num>[];
//                                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  List<int> v5 = [];
  List<num> v6 = [];

  (v5 && v6) = [1, 3.14];
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (v6 && v5) = [1, 3.14];
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
