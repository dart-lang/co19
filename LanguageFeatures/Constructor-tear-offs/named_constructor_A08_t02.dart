// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instantiated tear-off is constant and canonicalized if the
/// instantiating types are constant, and not even equal if they are not.
///
/// @description Checks that an instantiated tear-off is constant and
/// canonicalized if the instantiating types are constant - test generic class
/// @author iarkh@unipro.ru
/// @issue 46899
/// @issue 46900
/// @issue 46925

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class MyClass<T> {
  final a;
  const MyClass(int i, int j) : a = (i + j);
  const MyClass.constr() : a = 0;
}

main() {
  const v1 = MyClass<String>.new;
  const v2 = MyClass<int>.constr;
  const v3 = MyClass<int>.new;
  const v4 = MyClass<String>.constr;

  const v5 = MyClass<String>.new;
  const v6 = MyClass<int>.constr;
  const v7 = MyClass<int>.new;
  const v8 = MyClass<String>.constr;

  const CheckIdentical(v1, v5);
  const CheckIdentical(v2, v6);
  const CheckIdentical(v3, v7);
  const CheckIdentical(v4, v8);

  var c1 = v1(3, 14);
  var c2 = v1(3, 14);
  Expect.notEquals(c1, c2);

  var c3 = v2();
  var c4 = v2();
  Expect.notEquals(c3, c4);

  Expect.notEquals(c1, c3);

  var c5 = v3(3, 14);
  Expect.notEquals(c1, c5);

  var c6 = v4();
  Expect.notEquals(c3, c6);
}
