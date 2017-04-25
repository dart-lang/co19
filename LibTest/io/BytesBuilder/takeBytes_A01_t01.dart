/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> takeBytes()
 * Returns the contents of this and clears this.
 *
 * The list returned is a view of the internal buffer, limited to the length.
 * @description Checks that this method returns the contents of this and clears
 * this
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.addByte(1);
  builder.addByte(2);
  Expect.listEquals([1, 2], builder.takeBytes());
  Expect.listEquals([], builder.takeBytes());

  builder.add([1, 2, 3]);
  Expect.listEquals([1, 2, 3], builder.takeBytes());
  Expect.listEquals([], builder.takeBytes());
}
