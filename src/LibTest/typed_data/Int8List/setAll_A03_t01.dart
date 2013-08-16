/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * It is an error if the [iterable] is longer than length - [index].
 * @description Checks that an error is thrown if
 * the [iterable] is longer than length - index.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var l = new Int8List.fromList([]);
  try {
    l.setAll(0, [1]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  l = new Int8List.fromList([1, 2, 3]);
  try {
    l.setAll(0, [1, 2, 3, 4]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  l = new Int8List.fromList([1, 2, 3]);
  try {
    l.setAll(1, [1, 2, 3]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  l = new Int8List.fromList([1, 2, 3]);
  try {
    l.setAll(2, [1, 2]);
    Expect.fail("Error is expected");
  } catch(ok) {}
}

