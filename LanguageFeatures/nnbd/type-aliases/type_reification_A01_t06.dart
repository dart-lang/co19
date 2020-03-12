/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All types reified in legacy libraries are reified as legacy types.
 * @description Check that runtime type of the object of the class imported from
 * opted to legacy library can be casted correctly in opted-in code.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

import "../../../Utils/expect.dart";
import "type_reification_legacy_aliases_lib.dart";

main() {
  A? a1 = A1() as Object;
  var a2 = a1 as AliasA;
  A1 a3 = a2 as A1;
  Expect.throws(() { a2 as B; });
  Expect.throws(() { B() as A1iasA; });
}
