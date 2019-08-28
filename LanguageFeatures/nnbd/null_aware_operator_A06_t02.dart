/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e1 translates to F then e1?.[e2] translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]
 *
 * @description Check that if e1 translates to F then e1?.[e2] translates to:
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  int operator[](int index) => index;
}

main() {
  A a = new A();
  Expect.equals(42, a?.[42]);   /// static type warning

  List<String> list = ["Lily", "was", "here"];
  Expect.equals("Lily", list?.[0]);   /// static type warning
}
