/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * An error occurs if [start] is outside the range 0 .. length or if [end] is
 * outside the range start .. length.
 * @description Checks that it is an error if [end] is before [start].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Int16List.fromList([0, 0, 0, 0]);

  Expect.throws(() {
    list.sublist(3, 2);
  });

  Expect.throws(() {
    list.sublist(4, 0);
  });
}
