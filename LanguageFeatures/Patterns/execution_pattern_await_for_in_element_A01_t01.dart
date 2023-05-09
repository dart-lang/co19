// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an asynchronous for-in element
/// appears inside a synchronous function
///
/// @description Checks that it is a compile-time error if an asynchronous
/// for-in element appears inside a synchronous function. Test a list literal
/// @author sgrekhov22@gmail.com
/// @issue 52228

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

List<int> test1() {
  return [
    0,
    await for (var (v1 && v2) in Stream.fromIterable([1, 2, 3])) v1 + v2,
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
}

List<num> test2() {
  return [0, await for (final (num v) in Stream.fromIterable([1, 2, 3])) v];
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

List<int> test3() {
  return [0, await for (var (v) in Stream.fromIterable([1, 2, 3])) v];
//                              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

List<int> test4() {
  return [0, await for (final [v] in Stream.fromIterable([[1], [2], [3]])) v];
//                                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

List<int> test5() {
  return [0, await for (var {"k": v} in Stream.fromIterable([{"k": 1}])) v];
//                                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

List<int> test6() => [
  0,
  await for (final (v1, n: v2) in Stream.fromIterable([(1, n: 2)])) v1 + v2];
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified

List<dynamic> test7() => [
    0,
    await for (var Square(area: v) in Stream.fromIterable([Square(1)])) v];
//                                 ^^
// [analyzer] unspecified
// [cfe] unspecified

main() async {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
  test7();
}
