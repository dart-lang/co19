// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Return statement: If N is a statement of the form return E1; then:
///
///  Let before(E) = before(N).
///  Let after(N) = unreachable(after(E));
///
/// @description Checks reachability after return statement. Test static method
///
/// @author sgrekhov@unipro.ru


class C {
  static void   test() {
    late int i;
    bool b = false;
    if (b) {
      return;
      i = 42; // Variable is initialized in a dead code. This leaves it definitely unassigned
    }
    i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C.test();
}
