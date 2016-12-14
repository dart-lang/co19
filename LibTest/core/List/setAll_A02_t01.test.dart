/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * This operation does not increase the length of this.
 * @description Checks that this method does not increase the length of this
 * @author sgrekhov@unipro.ru
 */
library setAll_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List l = create(5);
  l.setAll(0, [1, 2, 3, 4, 5]);
  Expect.equals(5, l.length);

  l.setAll(4, []);
  Expect.equals(5, l.length);
}
