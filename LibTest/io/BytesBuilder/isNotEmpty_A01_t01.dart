/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNotEmpty
 * Returns true if the buffer is not empty.
 * @description Checks that this property returns true if the buffer is not empty
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();
  Expect.isFalse(builder.isNotEmpty);

  var data = [1, 2, 3];
  builder.add(data);
  Expect.isTrue(builder.isNotEmpty);
}
