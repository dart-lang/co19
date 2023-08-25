// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile error if the return type of the user-declared
/// operator []= is explicitly declared and not void.
///
/// @description Checks that it is a static warning if the return type of
/// the user-declared operator []= is not void.
/// @author msyabro
/// @author sgrekhov@unipro.ru
/// @issue 42198

class C {
  int operator []=(index, value) => 42;
//^^^
// [analyzer] unspecified
// [cfe] unspecified
  operator[](index) {}
}

main() {
  C c = new C();
  c[0] = new C();
}
