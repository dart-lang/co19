/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void shuffle([Random random])
 * Shuffles the elements of this list randomly.
 * @description Checks that this method shuffles the elements of this list
 * randomly. Test Random argument
 * @author sgrekhov@unipro.ru
 */
library shuffle_A01_t02;

import "dart:math";
import "../../../Utils/expect.dart";

test(List create([int length])) {
  List initial = [0, 1, 2, 3, 4];
  List lst = create();
  lst.addAll(initial);
  lst.shuffle(new Random());

  // check that all elements are present
  for (int i = 0; i < lst.length; i++) {
    initial.remove(lst[i]);
  }
  Expect.equals(0, initial.length);

  // check that some of the elements changed their position
  int count = 0;
  for (int i = 0; i < lst.length; i++) {
    if (lst[i] != i) {
      count++;
    }
  }
  Expect.isTrue(count > 0);
}
