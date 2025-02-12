// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// - Variable or getter: If `N` is an expression of the form `x` where the
///   type of `x` is `T` then:
/// If `T <: Never` then:
///   - Let `after(N) = unreachable(before(N))`.
/// Otherwise:
///   - Let `after(N) = before(N)`.
///
/// @description Checks that the code is unreachable after a variable of type
/// `Never`. Test a `for(;;)` statement in a set literal.
/// @author sgrekhov22@gmail.com
/// @issue 60089

void test1(Never n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    <int>{
      for (n;;) // The code after this point is unreachable
        i = 42, // Variable is initialized in a dead code. This leaves it definitely unassigned
      i = 0
    };
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2(Never n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    <int>{
      for (; n;) // The code after this point is unreachable
        i = 42,
      i = 0
    };
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3(Never n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    <int>{
      for (;; n) // The code after this for statement is unreachable
        i = 42,
      i = 0
    };
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test4(Never n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    <int>{
      for (var j = 0; j < 0; n) // Ok, not a dead code
        i = 42
    };
  }
  i; // Not an error
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
