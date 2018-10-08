/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * The iterable must not have more elements than what can fit from index to
 * length.
 * @description Checks that an error is thrown if the [iterable] is longer than
 * length - index.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List.fromList([]);
  Expect.throws(() {
    l.setAll(0, [1]);
  });

  l = new Int64List.fromList([1, 2, 3]);
  Expect.throws(() {
    l.setAll(0, [1, 2, 3, 4]);
  });

  l = new Int64List.fromList([1, 2, 3]);
  Expect.throws(() {
    l.setAll(1, [1, 2, 3]);
  });

  l = new Int64List.fromList([1, 2, 3]);
  Expect.throws(() {
    l.setAll(2, [1, 2]);
  });
}
