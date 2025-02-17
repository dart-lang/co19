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
/// `Never`. Test an `if` element in a set literal.
/// @author sgrekhov22@gmail.com

void test(Never n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    <Object>{
      if (n is String) // ignore: unnecessary_type_check
        i = 42 // Variable is initialized in a dead code. This leaves it definitely unassigned
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
