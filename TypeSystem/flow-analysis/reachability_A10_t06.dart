// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion throw: If `N` is a throw expression of the form `throw E1`, then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = unreachable(after(E1))`
///
/// @description Checks that a code after throw expression is unreachable. Test
/// `for(;;)` loop in set literals.
/// @author sgrekhov22@gmail.com

test1() {
  late int i;
  if ((() => false)()) {
    <int, int>{
      0: 1,
      for (throw "Dead code after this point";;)
        2: i = 42,
      i = 42: 3
    };
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int i;
  if ((() => false)()) {
    <int, int>{
      0: 1,
      for (; throw "Dead code after this point";)
        i = 42: 2,
      3: i = 42
    };
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  late int i;
  if ((() => false)()) {
    <int, int>{
      0: 1,
      for (;; throw "Dead code after this statement")
        1: 2,
      i = 42: 3
    };
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  late int i;
  if ((() => false)()) {
    <int, int>{
      0: 1,
      for (var j = 0; j < 0; throw "Not a dead code after this point")
        1: i = 42,
    };
  }
  i; // Ok
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
