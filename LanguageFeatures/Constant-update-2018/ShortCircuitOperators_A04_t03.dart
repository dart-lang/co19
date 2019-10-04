/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potentially constant
 * expression.
 * @description Checks that conditional operator [?]/[:] rejects the second
 * operand if condition is [true] for constant expressions
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const String str1 = true ? "OK" : 12345;
  Expect.equals("OK", str1);

  const String str2 = true ? "OK" : (null as String).length;
  Expect.equals("OK", str2);
}
