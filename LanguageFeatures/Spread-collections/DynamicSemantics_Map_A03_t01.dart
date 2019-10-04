/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Specification:
 * If the literal is constant, canonicalize it and make the map immutable.
 * @description Checks that constant map is cannonicalized and immutable.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const Map map1 = {1: 1, 2: 2, 3: 3};
const Map map2 = {};

main() {
  const Map res1 = {...map1};
  Expect.equals(map1, res1);
  Expect.throws(() => res1.clear());

  const Map res2 = {...map2};
  Expect.equals(map2, res2);
  Expect.throws(() => res2.addAll({7: 19}));
}
