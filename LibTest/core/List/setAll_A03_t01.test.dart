/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * The index must be non-negative and no greater than length.
 * @description Checks that the index must be non-negative and no greater than
 * length.
 * @author sgrekhov@unipro.ru
 */
library setAll_A03_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List l = create(5);
  Expect.throws(() {l.setAll(-1, [1, 2, 3, 4, 5]);});
  Expect.throws(() {l.setAll(5, [1, 2, 3, 4, 5]);});
}
