/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All types reified in legacy libraries are reified as legacy types.
 * @description Check that runtime type of the function imported from opted to
 * legacy library can be casted correctly in opted-in code.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "type_reification_legacy_lib.dart";

main() {
  var f1 = test1;
  F1 f2 = f1 as F1;
  F3<int> f3 = f2 as F3;
  Expect.throws(() { f3 as F2; });
}
