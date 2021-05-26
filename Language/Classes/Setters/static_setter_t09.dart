// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  It is a static warning if a class declares a static setter
/// named v= and also has a non-static member named v.
/// @description Checks that a compile error is arisen if a class has an
/// implicitly declared static setter and an instance method with the same name.
/// @issue 24573
/// @author ngl@unipro.ru


class C {
  static int v;
//           ^
// [analyzer] unspecified
  int v() { return 3; }
//    ^
// [cfe] unspecified
}

main() {
  C.v = 2;
//    ^
// [cfe] unspecified
}
