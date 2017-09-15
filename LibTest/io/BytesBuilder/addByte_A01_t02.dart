/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addByte(int byte)
 * Append byte to the current contents of the builder.
 *
 * The byte will be bit-representation truncated to the range 0 .. 255.
 * @description Checks that [byte] value is truncated to the range 0 .. 255.
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.addByte(-1);
  builder.addByte(-2);
  Expect.listEquals([255, 254], builder.toBytes());

  builder.addByte(256);
  builder.addByte(257);
  Expect.listEquals([255, 254, 0, 1], builder.takeBytes());

  builder.addByte(1000000);
  builder.addByte(-1000000);
  builder.addByte(123456789);
  builder.addByte(-123456789);
  Expect.listEquals(
    [1000000, -1000000, 123456789, -123456789].map((int e) => e & 255).toList(),
    builder.toBytes()
  );

}
