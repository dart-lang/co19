/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> toBytes()
 * Returns a copy of the current contents of the builder.
 *
 * Leaves the contents of the builder intact.
 * @description Checks that this method returns a copy of the current contents
 * of the builder.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.addByte(1);
  builder.addByte(2);
  Expect.listEquals([1, 2], builder.toBytes());
  Expect.listEquals([1, 2], builder.toBytes());

  builder.add([1, 2, 3]);
  Expect.listEquals([1, 2, 1, 2, 3], builder.toBytes());
  Expect.listEquals([1, 2, 1, 2, 3], builder.toBytes());
}
