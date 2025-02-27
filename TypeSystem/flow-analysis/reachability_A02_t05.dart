// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion True literal: If `N` is the literal `true`, then:
///  Let `true(N) = before(N)`.
///  Let `false(N) = unreachable(before(N))`.
///
/// @description Checks reachability after `true` literal in collection literals
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  [
    if (true)
      i = 42
  ];
  i; // Definitely assigned, not an error
}

void test2() {
  late int i;
  <int>{
    if (true)
      i = 42
  };
  i; // Definitely assigned, not an error
}

void test3() {
  late int i;
  <int, int>{
    if (true)
      1: i = 42
  };
  i; // Definitely assigned, not an error
}

main() {
  test1();
  test2();
  test3();
}
