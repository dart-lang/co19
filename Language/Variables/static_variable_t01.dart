// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static variable is a variable whose declaration is immediately
/// nested inside a class, mixin, enum, or extension declaration and includes
/// the modifier static
///
/// @description Checks that a static variable is not associated with a
/// particular instance.
/// @author kaigorodov

import "../../Utils/expect.dart";

class Cl {
  static var _foo;
  int get foo => _foo;
  void set foo(int val) {
    _foo = val;
  }
}

main() {
  Cl c1 = new Cl();
  Cl c2 = new Cl();
  c2.foo = 1;
  Expect.equals(1, c1.foo);
  c2.foo = 2;
  Expect.equals(2, c1.foo);
}
