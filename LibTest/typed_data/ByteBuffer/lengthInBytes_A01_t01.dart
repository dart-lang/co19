/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lengthInBytes
 * Returns the length of this view, in bytes.
 * @description Checks that the correct length is returned.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(count) {
  var buffer = new Int8List(count).buffer;
  Expect.equals(count, buffer.lengthInBytes);
}

main() {
  check(0);
  check(1);
  check(100);
}
