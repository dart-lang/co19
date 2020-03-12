/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All types reified in legacy libraries are reified as legacy types.
 * @description Check that runtime type of the object of the class imported from
 * opted to legacy library is a legacy type.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

import "../../../Utils/expect.dart";
import "type_reification_legacy_aliases_lib.dart";

main() {
  var a = AliasA();
  Expect.isTrue(a is AliasA);
  Expect.isTrue(a is AliasA?);
  Expect.isTrue(a is A);
  Expect.isTrue(a is A?);
  Expect.isFalse(a is A1);
  Expect.isFalse(a is A1?);
}
