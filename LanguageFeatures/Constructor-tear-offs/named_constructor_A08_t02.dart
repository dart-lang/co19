// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instantiated tear-off is constant and canonicalized if the
/// instantiating types are constant, and not even equal if they are not.
///
/// @description Checks that An instantiated tear-off is constant and
/// canonicalized if the instantiating types are constant - test generic class
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class MyClass<T> {
  final a;
  const MyClass(int i, int j) : a = (i + j);
  const MyClass.constr() : a = 0;
}

main() {
  var v1 = MyClass<String>.new;
  var v2 = MyClass<int>.constr;
  var v3 = MyClass<int>.new;
  var v4 = MyClass<String>.constr;

  const c1 = v1(3, 14);
  const c2 = v1(3, 14);
  Expect.identical(c1, c2);

  const c3 = v2();
  const c4 = v2();
  Expect.identical(c3, c4);

  Expect.notEquals(c1, c3);

  const c5 = v3(3, 14);
  Expect.notEquals(c1, c5);

  const c6 = v4();
  Expect.notEquals(c3, c6);
}
