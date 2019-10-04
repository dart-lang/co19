/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, we define inference on a setOrMapLiteral collection as
 * follows:
 *
 * If collection is unambiguously a set literal:
 * ...
 * Otherwise, the static type of collection is P.
 *
 * @description Checks that if collection is unambiguously a set literal and P
 * is not ? then the static type of collection is P
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Set v = {1, 2, 3};
  Expect.isTrue(v is Set<dynamic>);
  Expect.isFalse(v is Set<int>);
}
