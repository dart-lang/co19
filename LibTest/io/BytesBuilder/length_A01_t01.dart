/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length
 * The number of bytes in the builder.
 * @description Checks that this property returns the number of bytes in the
 * builder
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();
  Expect.equals(0, builder.length);

  var data = [1, 2, 3];
  builder.add(data);
  Expect.equals(3, builder.length);

  builder.addByte(0);
  Expect.equals(4, builder.length);
}
