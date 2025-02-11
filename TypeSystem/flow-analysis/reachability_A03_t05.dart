// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion False literal: If `N` is the literal `false`, then:
///  Let `true(N) = unreachable(before(N))`.
///  Let `false(N) = before(N)`
///
/// @description Checks reachability after `false` literal in collection literals
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  [
    if (false)
      i = 42
  ];
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2() {
  late int i;
  <int>{
    if (false)
      i = 42
  };
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3() {
  late int i;
  <int, int>{
    if (false)
      1: i = 42
  };
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test1();
  test2();
  test3();
}
