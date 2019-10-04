/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Specification:
 *  If the literal is constant, canonicalize it and make the map immutable.
 * @description Checks that non-constant map is not cannonicalized and mutable.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const Map map1 = {1: 1, 2: 2, 3: 3};
const Map map2 = {};

main() {
  Map res1 = {...?map1};
  Expect.notEquals(map1, res1);
  res1.clear();

  Map res2 = {...?map2};
  Expect.notEquals(map2, res2);
  res2.addAll({7: 19});

  Map res3 = {...?null};
  Expect.notEquals(map2, res3);
  res3.addAll({7: 19});
}
