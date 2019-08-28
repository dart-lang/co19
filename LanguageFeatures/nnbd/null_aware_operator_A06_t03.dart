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
 *  SHORT[EXP(e1), fn[x] => x[EXP(e2)]]. Test type aliases
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class A {
  int operator[](int index) => index;
}

typedef AAlias1 = A?;
typedef AAlias2 = A;
typedef ListAlias1 = List<String>?;
typedef ListAlias2 = List<String>;

main() {
  AAlias1 a1 = null;
  Expect.isNull(a1?.[42]);
  a1 = new A();
  Expect.equals(42, a1?.[42]);

  AAlias2 a2 = new A();
  Expect.equals(42, a2?.[42]);   /// static type warning

  ListAlias1 list1 = null;
  Expect.isNull(list1?.[42]);
  list1 = ["Lily", "was", "here"];
  Expect.equals("Lily", list1?.[0]);

  ListAlias list2 = ["Let", "it", "be"];
  Expect.equals("Let", list2?.[0]);   /// static type warning
}
