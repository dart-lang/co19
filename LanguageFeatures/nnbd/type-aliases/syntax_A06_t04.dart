/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of selectors is extended to allow null-aware
 * subscripting using the syntax e1?[e2] which evaluates to null if e1
 * evaluates to null and otherwise evaluates as e1[e2].
 *
 * @description Check that the grammar of selectors is extended to allow
 * null-aware subscripting using the syntax e1?[e2] which evaluates to null if
 * e1 evaluates to null and otherwise evaluates as e1[e2]. Test legacy pre-NNBD
 * types and type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";
import "legacy_library_aliases_lib.dart";

typedef AAlias2 = A?;
typedef AAlias3 = AAlias?;

main() {
  AAlias? a1 = null;
  Expect.isNull(a1?[42]);
  a1 = new A();
  Expect.equals(42, a1?[42]);

  AAlias2 a2 = null;
  Expect.isNull(a2?[42]);
  a2 = new A();
  Expect.equals(42, a2?[42]);

  AAlias3 a3 = null;
  Expect.isNull(a3?[42]);
  a3 = new A();
  Expect.equals(42, a3?[42]);
}
