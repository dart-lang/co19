// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-local variable introduces a setter iff it does not have the
/// modifier final or the modifier const, or it is late and final, but does not
/// have an initializing expression.
///
/// @description Checks that it is not an error if a local variable is final and
/// not initialized at its point of declaration.
/// @author ilya

class C {
  f() {
    final i;
    return i = 1;
  }
}

main() {
  new C().f();
}
