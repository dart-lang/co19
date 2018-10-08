/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Checks that this iterable has only one element, and returns that element.
 * @description Checks that the single element of a list is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l;

  l = new Int16List.fromList([0]);
  Expect.equals(0, l.single);
  l = new Int16List.fromList([127]);
  Expect.equals(127, l.single);
  l = new Int16List.fromList([-1]);
  Expect.equals(-1, l.single);
}
