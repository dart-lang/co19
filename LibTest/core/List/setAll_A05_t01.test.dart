/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * If iterable is based on this list, its values may change /during/ the setAll
 * operation.
 * @description Checks that if iterable is based on this list, its values may
 * change /during/ the setAll operation.
 * @author sgrekhov@unipro.ru
 */
library setAll_A05_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List l = create(5);
  l.setAll(0, [1, 2, 3, 4, 5]);
  l.setAll(0, l.getRange(2, 5));

  Expect.equals(3, l[0]);
  Expect.equals(4, l[1]);
  Expect.equals(5, l[2]);
  Expect.equals(4, l[3]);
  Expect.equals(5, l[4]);
}
