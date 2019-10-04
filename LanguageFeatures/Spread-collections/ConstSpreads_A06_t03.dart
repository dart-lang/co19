/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This enables in-place literals (which aren't very useful):
 *
 *   const list = [...["why"]];
 * @description Checks that in-place literals are enabled for maps
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const res1 = {...{1: "why"}};
  Expect.mapEquals({1: "why"}, res1);

  const res2 = {...{}};
  Expect.mapEquals({}, res2);

  const Map aMap = {3: 3};
  const res3 = {1: 1, ...{2: 2}, 3: aMap};
  Expect.mapEquals({1: 1, 2: 2, 3: aMap}, res3);
}
