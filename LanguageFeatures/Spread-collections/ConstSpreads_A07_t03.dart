/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It also enables const expressions that refer to constant
 * collections defined elsewhere, which is useful:
 *
 *   const list = [2, 3];
 *   const another = [1, ...list, 4]; // [1, 2, 3, 4].
 * @description: Checks that spread element in the map can refer to constant
 * collections defined elsewhere
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const map = {2: 20, 3: 30};
  const Map map1 = null;

  const res1 = {1: 10, ...map, 4: 40};
  Expect.mapEquals({1: 10, 2: 20, 3: 30, 4: 40}, res1);

  const res2 = {1: 10, ...?map, 4: 40};
  Expect.mapEquals({1: 10, 2: 20, 3: 30, 4: 40}, res2);

  const res3 = {1: 10, ...?map1, 4: 40};
  Expect.mapEquals({1: 10, 4: 40}, res3);
}
