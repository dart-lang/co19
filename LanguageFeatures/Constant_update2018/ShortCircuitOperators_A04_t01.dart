/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potenatially constant
 * expression.
 * @description Checks that conditional operator [?]/[:] rejects the second
 * operand if the first one is [true].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
import "../../Utils/expect.dart";

class MyClass {
  final bool res;
  const MyClass(bool test) : res = (true ? test : (null as String).length);
}

main() {
  const MyClass c1 = MyClass(true);
  Expect.isTrue(c1.res);

  const String str = true ? "OK" : (null as String).length;
  Expect.equals("OK", str);
}
