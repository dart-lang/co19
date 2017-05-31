/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * ...
 * The returned Iterable is lazy, and calls f for each element of this every
 * time it's iterated.
 * @description Checks that the returned [Iterable] is lazy, and calls f for
 * each element of this every time it's iterated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int16List.fromList([1, 2, 3, 4]);
  var counter = 0;
  var res = l.expand((element) {counter++; return [element * 2];});
  var it = res.iterator;
  Expect.equals(0, counter);
  int i = 0;
  while (it.moveNext()) {
    Expect.equals(++i, counter);
  }
  Expect.equals(l.length, i);
}
