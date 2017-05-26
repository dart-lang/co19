/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool moveNext()
 * Returns whether the [Iterator] has elements left.
 * @description Checks that true is returned only if the [Iterator] has elements
 * left.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l;
  l = new Int8List.fromList([]);
  Expect.isFalse(l.iterator.moveNext());

  l = new Int8List.fromList([1]);
  var it = l.iterator;
  Expect.isTrue(it.moveNext());
  Expect.isFalse(it.moveNext());

  l = new Int8List(1000);
  it = l.iterator;
  for (var i = 0; i < 1000; ++i) {
    Expect.isTrue(it.moveNext());
  }
  Expect.isFalse(it.moveNext());
}
