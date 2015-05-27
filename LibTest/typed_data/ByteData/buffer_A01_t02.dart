/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final ByteBuffer buffer
 * Returns the byte buffer associated with this object.
 * @description Checks that [buffer] is final and can't be set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(count) {
  var l = new ByteData(count);
  try {
    l.buffer = new Int8List(count).buffer;
    Expect.fail("[buffer] should be final");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  check(0);
  check(1);
  check(100);
}
