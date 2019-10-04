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
 * @description Checks that conditional operator [?]/[:] works correctly if all
 * the operands are correct constant expressions.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const ok_str = "OK";
const wrong_str = "wrong";

main() {
  const String str1 = true ? "true" : "false";
  Expect.equals("true", str1);

  const String str2 = false ? "false" : "true";
  Expect.equals("true", str1);

  const String str3 = true ? ok_str : wrong_str;
  Expect.equals("OK", str3);

  const String str4 = false ? wrong_str : ok_str;
  Expect.equals("OK", str4);

}
