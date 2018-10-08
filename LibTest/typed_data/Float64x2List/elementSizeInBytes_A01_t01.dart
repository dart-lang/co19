/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int elementSizeInBytes
 * Returns the number of bytes in the representation of each element in this
 * list.
 * @description Checks that the number of bytes for each element in a
 * [Float64x2List] is equal to 16 or Float64x2List.bytesPerElement.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64x2List(0);
  Expect.equals(16, l.elementSizeInBytes);
  Expect.equals(Float64x2List.bytesPerElement, l.elementSizeInBytes);
}
