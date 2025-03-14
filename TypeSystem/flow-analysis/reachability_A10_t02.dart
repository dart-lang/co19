// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion throw: If `N` is a throw expression of the form `throw E1`, then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = unreachable(after(E1))`
///
/// @description Checks that code after a throw expression is unreachable. Test
/// collection literals.
/// @author sgrekhov22@gmail.com

test1() {
  late int i;
  if ((() => false)()) {
    [
      0,
      throw "Dead code after this point",
      i = 42 // This is dead code, which leaves `i` definitely unassigned.
    ];
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int i;
  if ((() => false)()) {
    <int>{
      0,
      throw "Dead code after this point",
      i = 42
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
    <String, int>{
      "key1": 0,
      "key2": throw "Dead code after this point",
      "key3": i = 42
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
    <int, String>{
      0: "value1",
      throw "Dead code after this point": "value2",
      i = 42: "value3"
    };
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
