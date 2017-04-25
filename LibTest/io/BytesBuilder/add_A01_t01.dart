/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> bytes)
 * Appends bytes to the current contents of the builder.
 * Each value of bytes will be bit-representation truncated to the range
 * 0 .. 255.
 * @description Checks that this method appends bytes to the current contents of
 * the builder
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.add([1, 2, 3]);
  builder.add([4, 5, 9]);
  Expect.listEquals([1, 2, 3, 4, 5, 9], builder.toBytes());

  builder.add([0]);
  Expect.listEquals([1, 2, 3, 4, 5, 9, 0], builder.toBytes());
}
