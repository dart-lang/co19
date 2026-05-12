// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that the code is unreachable after `await n;` expression,
/// where `n` has type `Never`.
/// @author sgrekhov22@gmail.com

void test1(Never n) async {
  late int i;
  bool b = (() => true)();
  if (b) {
    await n;        // The code after this point is unreachable
    i = 42;   // This is dead code, which leaves `i` definitely unassigned.
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2() async {
  late int i;
  bool b = (() => true)();
  if (b) {
    await (throw 42);        // The code after this point is unreachable
    i = 42;   // This is dead code, which leaves `i` definitely unassigned.
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
