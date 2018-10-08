/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int elementSizeInBytes
 * Returns the number of bytes in the representation of each element in this
 * list.
 * @description Checks that the number of bytes in element of [ByteData] equals
 * 1.
 * @issue 12881
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new ByteData(0);
  Expect.equals(1, l.elementSizeInBytes);
}
