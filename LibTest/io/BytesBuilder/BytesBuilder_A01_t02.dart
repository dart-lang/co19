/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion BytesBuilder({bool copy: true})
 * Construct a new empty BytesBuilder.
 *
 * If copy is true, the data is always copied when added to the list. If it copy
 * is false, the data is only copied if needed. That means that if the lists are
 * changed after added to the BytesBuilder, it may effect the output. Default is
 * true.
 * @description Checks that this constructor creates a new empty BytesBuilder.
 * Test copy == false
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder(copy: false);
  Expect.isTrue(builder.isEmpty);

  Uint8List data = new Uint8List.fromList([1, 2, 3]);
  builder.add(data);

  data[0] = 0;

  Expect.listEquals(data, builder.toBytes());
}
