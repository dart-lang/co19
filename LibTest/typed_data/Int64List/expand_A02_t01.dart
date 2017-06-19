/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable f(E element))
 * ...
 * The returned Iterable is lazy, and calls f for each element of this every
 * time it's iterated.
 * @description Checks that returned Iterable is lazy.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List.fromList([1, 2, 3, 4, 5, 6]);
  var counter = 0;

  var res = l.expand((element) {counter++; return [element * 2];});
  Expect.equals(0, counter);

  res.elementAt(0);
  Expect.equals(1, counter);
}
