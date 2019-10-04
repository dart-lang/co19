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
 * @description: Checks that spread element in the set can refer to constant
 * collections defined elsewhere
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const list = [2, 3];
  const List list1 = null;
  const res1 = {1, ...list, 4};
  Expect.setEquals({1, 2, 3, 4}, res1);
  const res2 = {1, ...?list, 4};
  Expect.setEquals({1, 2, 3, 4}, res2);
  const res3 = {1, ...?list1, 4};
  Expect.setEquals({1, 4}, res3);

  const set = {2, 3};
  const res4 = {1, ...set, 4};
  Expect.setEquals({1, 2, 3, 4}, res4);
  const res5 = {1, ...?set, 4};
  Expect.setEquals({1, 2, 3, 4}, res5);
}
