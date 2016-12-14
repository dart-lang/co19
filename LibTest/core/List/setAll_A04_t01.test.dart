/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * The iterable must not have more elements than what can fit from index to
 * length.
 * @description Checks that the iterable must not have more elements than what
 * can fit from index to length.
 * @author sgrekhov@unipro.ru
 */
library setAll_A04_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List l = create(5);
  Expect.throws(() {l.setAll(0, [1, 2, 3, 4, 5, 6]);});
  Expect.throws(() {l.setAll(4, [1, 2]);});
  Expect.throws(() {l.setAll(3, [1, 2, 3]);});
}
