/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [&], [|] and [^] binary operators are now also allowed when
 * the operands are of type [bool].
 * @description Checks that operator [|] is accepted for potentially constant of
 * type [bool].
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

class MyClass {
  final a;
  const MyClass(bool i1, bool i2) : a = (i1 | i2);
}

main() {
  const MyClass c1 = MyClass(true, true);
  Expect.isTrue(c1.a);

  const MyClass c2 = MyClass(true, false);
  Expect.isTrue(c2.a);

  const MyClass c3 = MyClass(false, true);
  Expect.isTrue(c3.a);

  const MyClass c4 = MyClass(false, false);
  Expect.isFalse(c4.a);
}
