// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instantiated tear-off is constant and canonicalized if the
/// instantiating types are constant, and not even equal if they are not.
///
/// @description Checks that an instantiated tear-off are not equal if the
/// instantiating types are not constant - test non-generic class
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class MyClass {
  int a;
  MyClass(int i, int j) : a = (i + j);
  MyClass.constr() : a = 0;
}

main() {
  var v1 = MyClass.new;
  var v2 = MyClass.constr;

  var c1 = v1(1, 2);
  var c2 = v1(1, 2);
  Expect.notEquals(c1, c2);

  var c3 = v2();
  var c4 = v2();
  Expect.notEquals(c3, c4);

  Expect.notEquals(c1, c3);
}
