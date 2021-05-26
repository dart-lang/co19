// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if the return type of the user-declared
/// operator []= is explicitly declared and not void.
/// @description Checks that it is a compile-time error if the return type of
/// the user-declared operator []= is not void.
/// @author msyabro
/// @author sgrekhov@unipro.ru


class C {
  int operator[]=(index, value) {}
//^
// [analyzer] unspecified
// [cfe] unspecified
  operator[](index) {}
}

main() {
  C c = new C();
  c[0] = null;
}
