// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-local variable introduces a setter iff it does not have the
/// modifier final or the modifier const, or it is late and final, but does not
/// have an initializing expression.
///
/// @description Checks that it is a compile-time error to read a local
/// definitely unassigned final variable.
/// @author iarkh@unipro.ru
/// @author sgrekhov@unipro.ru

class C {
  f() {
    final i;
    return i;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new C().f();
}
