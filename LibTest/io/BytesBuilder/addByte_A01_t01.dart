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
 * @description Checks that this method byte to the current contents of the
 * builder
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.addByte(1);
  builder.addByte(2);
  Expect.listEquals([1, 2], builder.toBytes());

  builder.addByte(255);
  Expect.listEquals([1, 2, 255], builder.toBytes());
}
