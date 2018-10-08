/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int elementSizeInBytes
 * Returns the number of bytes in the representation of each element in this
 * list.
 * @description Checks that number of bytes for each element in Int32x4List is
 * equal 16 or Int32x4.bytesPerElement.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int32x4List(2);
  Expect.equals(16, l.elementSizeInBytes);
  Expect.equals(l.elementSizeInBytes, Int32x4List.bytesPerElement);
}
