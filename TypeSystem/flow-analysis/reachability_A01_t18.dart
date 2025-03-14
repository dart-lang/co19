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
/// `Never`. Test a set literal.
/// @author sgrekhov22@gmail.com

void test(Never n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    <Object>{
      n,        // The code after this point is unreachable
      i = 42    // This is dead code, which leaves `i` definitely unassigned.
    };
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
