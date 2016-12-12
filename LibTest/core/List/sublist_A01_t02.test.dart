/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * Returns a new list containing the objects from start inclusive to end
 * exclusive.
 * @description Checks that it is an error if end is greater then start
 * @author sgrekhov@unipro.ru
 */
library sublist_A01_t02;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List lst = create();
  lst.addAll([0, 1, 2, 3, 4]);

  Expect.throws(() {lst.sublist(3, 2);});
  Expect.throws(() {lst.sublist(1, 0);});
  Expect.throws(() {lst.sublist(4, 3);});
}
