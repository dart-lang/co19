// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an asynchronous for-in element
/// appears inside a synchronous function
///
/// @description Checks that it is a compile-time error if an asynchronous
/// for-in element appears inside a synchronous function. Test a map literal
/// @author sgrekhov22@gmail.com
/// @issue 52228

import "patterns_lib.dart";

Map<String, int> test1() {
  return {
    "k0": 0,
    await for (var (v1 && v2) in Stream.fromIterable([1, 2, 3])) "k$v1": v2,
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified
    };
}

Map<String, num> test2() {
  return {"k0": 0, await for (final (num v) in Stream.fromIterable([1, 2, 3])) "k$v": v};
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

Map<String, int> test3() {
  return {"k0": 0, await for (var (v) in Stream.fromIterable([1, 2, 3])) "k$v": v};
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

Map<String, int> test4() {
  return {
    "k0": 0,
    await for (final [v] in Stream.fromIterable([[1], [2], [3]])) "k$v": v
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

Map<String, int> test5() {
  return {
    "k0": 0,
    await for (var {"k": v} in Stream.fromIterable([{"k": 1}])) "k$v": v
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

Map<String, int> test6() => {
  "k0": 0,
  await for (final (v1, n: v2) in Stream.fromIterable([(1, n: 2)])) "k$v1": v2
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  };

Map<String, dynamic> test7() => {
    "k0": 0,
    await for (var Square(area: v) in Stream.fromIterable([Square(1)])) "k$v": v
//                                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  };

main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
  test7();
}
