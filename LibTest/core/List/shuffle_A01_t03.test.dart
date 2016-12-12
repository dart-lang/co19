/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void shuffle([Random random])
 * Shuffles the elements of this list randomly.
 * @description Checks that this method shuffles the elements of this list
 * randomly. Test an empty list
 * @author sgrekhov@unipro.ru
 */
library shuffle_A01_t03;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List lst = create();
  lst.shuffle();
  Expect.equals(0, lst.length);
}
