/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator [??] rejects the second operand if the
 * first one is not [null] in constant expression.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const dynamic d1 = "12345";
const dynamic d2 = 11;
const int i = 14;

main() {
  const int a1 = 20 ?? (null as String).length;
  Expect.equals(20, a1);

  const String a2 = "testme" ?? "wrong";
  Expect.equals("testme", a2);

  const int a3 = i ?? d1;
  Expect.equals(14, a3);

  const int a4 = i ?? d2;
  Expect.equals(14, a4);

  const a5 = d1 ?? null;
  Expect.equals(a5, a5);
}
