// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// Description    Operator                          Associativity Precedence
/// Equality         ==                                None           7
/// @description Test that '==' equality operator has no associativity. It is
/// compile error to expect any associativity from it
/// @author sgrekhov@unipro.ru


class C {

  bool operator ==(C val) {
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    return true;
  }

  C();
}

main() {
  C c1 = new C();
  C c2 = new C();
  C c3 = new C();

  C c = c1 == c2 == c3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
