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
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "type_reification_legacy_lib.dart";

main() {
  Object? a1 = A1() as Object;
  var a2 = a1 as A;
  A1 a3 = a2 as A1;
  Expect.throws(() { a1 as B; });
  Expect.throws(() { A() as A1; });

  B<A> b = B<A>();
  B b1 = b as B;
  Expect.throws(() { b1 as B<A1>; });
  Expect.throws(() { b1 as A; });
}
