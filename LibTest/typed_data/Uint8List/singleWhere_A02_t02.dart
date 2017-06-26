/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * ...
 * Checks all elements to see if test(element) returns true. If exactly one
 * element satisfies test, that element is returned. Otherwise, if there are no
 * matching elements, or if there is more than one matching element, a
 * [StateError] is thrown.
 * @description Checks that a [StateError] is thrown if more than one element
 * match [test].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint8List.fromList([1, 2, 3, 4, 5]);
  try {
    l.singleWhere((e) => true);
    Expect.fail("StateError is expected");
  } on StateError {}

  l = new Uint8List.fromList([1, 2, 3, 4, 5]);
  try {
    l.singleWhere((e) => e != 0);
    Expect.fail("StateError is expected");
  } on StateError {}
}
