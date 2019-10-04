/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, we define inference on a setOrMapLiteral collection as
 * follows:
 * ...
 * Else, if collection is unambiguously a map literal where P is Map<Pk, Pv>:
 * ...
 * Otherwise the static key type of collection is K where K is determined by
 * downwards inference.
 *
 * @description Checks that if collection is unambiguously a map literal and Pk
 * is not ? then the static type of collection is K where K is determined by
 * downwards inference.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var m = {1: 1, 2: 2, 3: 3};
  Expect.isTrue(m is Map<int, int>);
}
