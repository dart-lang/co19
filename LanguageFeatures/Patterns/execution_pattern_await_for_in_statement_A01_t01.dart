// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an asynchronous for-in statement
/// appears inside a synchronous function
///
/// @description Checks that it is a compile-time error if an asynchronous
/// for-in statement appears inside a synchronous function
/// @author sgrekhov22@gmail.com
/// @issue 52228

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

test1() {
  await for (var (v1 && v2) in Stream.fromIterable([1, 2, 3])) {
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v1);
    print(v2);
  }
}

test2() {
  await for (final (num v) in Stream.fromIterable([1, 2, 3])) {
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v);
  }
}

test3() {
  await for (var (v) in Stream.fromIterable([1, 2, 3])) {
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v);
  }
}

test4() {
  await for (final [v] in Stream.fromIterable([[1], [2], [3]])) {
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v);
  }
}

test5() {
  await for (var {"k": v} in Stream.fromIterable([{"k": 1}])) {
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v);
  }
}

test6() {
  await for (final (v1, n: v2) in Stream.fromIterable([(1, n: 2)])) {
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v1);
    print(v2);
  }
}

test7() {
  await for (var Square(area: v) in Stream.fromIterable([Square(1)])) {
//                               ^^
// [analyzer] unspecified
// [cfe] unspecified
    print(v);
  }
}

main() async {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
  test7();
}
