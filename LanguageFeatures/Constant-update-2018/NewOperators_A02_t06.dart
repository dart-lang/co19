/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [&], [|] and [^] binary operators are now also allowed when
 * the operands are of type [bool].
 * @description Checks that operator [|] is accepted for constants of type
 * [bool].
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const bool b1 = true;
const bool b2 = false;

class MyClass {
  final a;
  const MyClass(bool i) : a = (b1 | i);
}

main() {
  const bool b3 = b1 | b2;
  Expect.isTrue(b3);

  Expect.isTrue(true | true);
  Expect.isTrue(true | false);
  Expect.isFalse(false | false);

  const MyClass c1 = MyClass(true);
  Expect.isTrue(c1.a);

  const MyClass c2 = MyClass(false);
  Expect.isTrue(c2.a);
}
