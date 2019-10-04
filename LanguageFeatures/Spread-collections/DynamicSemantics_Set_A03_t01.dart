/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Specification:
 * If the literal is constant, canonicalize it make the set immutable.
 * @description Checks that constant set is cannonicalized and immutable.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const List list1 = [1, 2, 3, 4, 5];
const List list2 = [];

const Set set1 = {1, 2, 3, 4, 5};
const Set set2 = {};

main() {
  const Set res1 = {...list1};
  Expect.equals(set1, res1);
  Expect.throws(() => res1.add(123));

  const Set res2 = {...set1};
  Expect.equals(set1, res2);
  Expect.throws(() => res2.clear());

  const Set res3 = {...list2};
  Expect.equals(set2, res3);
  Expect.throws(() => res3.add(123));

  const Set res4 = {...set2};
  Expect.equals(set2, res4);
  Expect.throws(() => res4.clear());
}
