/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void clear()
 * Clear the contents of the builder.
 * @description Checks that this method clears the contents of the builder
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.add([1, 2, 3]);
  builder.add([4, 5, 9]);
  builder.clear();
  Expect.isTrue(builder.isEmpty);
  Expect.listEquals([], builder.toBytes());

  builder.addByte(13);
  builder.clear();
  Expect.isTrue(builder.isEmpty);
  Expect.listEquals([], builder.toBytes());
}
