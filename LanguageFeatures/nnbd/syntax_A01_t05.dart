/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of types is extended to allow any type to be suffixed
 * with a ? (e.g. int?) indicating the nullable version of that type.
 *
 * @description Check that any type can be suffixed with a ? indicating the
 * nullable version of that type. Test different valid cases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

int ? testInt(int ? i) => i == null ? i ?? 0 : i;

int ?
testInt2(int
? i) => i == null ? i ??
0 : i;

main() {
  var x = null;
  int ? a = x ??= 3 > 0 ? x ?? 1: x ?? 2;
  Expect.equals(1, a);
  Expect.equals(testInt(a), a);
}
