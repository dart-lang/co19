// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instantiated tear-off is constant and canonicalized if the
/// instantiating types are constant, and not even equal if they are not.
///
/// @description Checks that an instantiated tear-off is constant and
/// canonicalized if the instantiating types are constant - test non-generic
/// class
/// @author iarkh@unipro.ru
/// @issue 46899
/// @issue 46900
/// @issue 46925

import "../../Utils/expect.dart";

class MyClass {
  final a;
  const MyClass(int i, int j) : a = (i + j);
  const MyClass.constr() : a = 0;
}

main() {
  const v1 = MyClass.new;
  const v2 = MyClass.constr;

  var c1 = v1(3, 14);
  var c2 = v1(3, 14);
  Expect.notEquals(c1, c2);

  var c3 = v2();
  var c4 = v2();
  Expect.notEquals(c3, c4);

  Expect.notEquals(c1, c3);
}
