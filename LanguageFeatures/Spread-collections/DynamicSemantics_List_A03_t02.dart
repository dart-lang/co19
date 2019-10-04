/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Specification:
 * If the literal is constant, the list is canonicalized and immutable,
 * otherwise it is not.
 * @description Checks that non-constant list is not cannonicalized and mutable.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const List list1 = [1, 2, 3, 4, 5];
const List list2 = [];

const Set set1 = {1, 2, 3, 4, 5};
const Set set2 = {};

main() {
  List res1 = [...list1];
  Expect.notEquals(list1, res1);
  res1.add(123);

  List res2 = [...set1];
  Expect.notEquals(list1, res2);
  res2[0]++;

  List res3 = [...list2];
  Expect.notEquals(list2, res3);
  res3.add(123);

  List res4 = [...set2];
  Expect.notEquals(list2, res4);
  res4.add(123);
}
