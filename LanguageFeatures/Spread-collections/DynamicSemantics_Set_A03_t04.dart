/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Specification:
 * If the literal is constant, canonicalize it make the set immutable.
 * @description Checks that non-constant set is not cannonicalized and mutable.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const List list1 = [1, 2, 3, 4, 5];
const List list2 = [];

const Set set1 = {1, 2, 3, 4, 5};
const Set set2 = {};

main() {
  Set res1 = {...?list1};
  Expect.notEquals(set1, res1);
  res1.add(123);

  Set res2 = {...?set1};
  Expect.notEquals(set1, res2);
  res2.add(14);

  Set res3 = {...?list2};
  Expect.notEquals(set2, res3);
  res3.add(123);

  Set res4 = {...?set2};
  Expect.notEquals(set2, res4);
  res4.add(123);

  Set res5 = {...?null};
  Expect.notEquals(set2, res5);
  res5.add(-8);
 }
