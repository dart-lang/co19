/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * It is an error if the start and end are not valid ranges
 * at the time of the call to this method.
 * @description Checks that an error is thrown.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Int8List.fromList(list);
  try {
    l.getRange(-1, list.length);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.getRange(0, list.length + 1);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.getRange(-1, list.length + 1);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.getRange(0x80000000, 0x7fffffff);
    Expect.fail("Error is expected");
  } catch(ok) {}
}

main() {
  check([]);
  check([1]);
  check([0,0,0,0,0,0,0,0,0,0]);
}
