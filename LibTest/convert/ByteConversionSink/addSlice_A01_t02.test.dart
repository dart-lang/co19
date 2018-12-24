/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addSlice(List<int> chunk, int start, int end, bool isLast)
 * Adds the next chunk to this.
 * ...
 * If isLast is true closes this.
 * ...
 * @description Checks that if isLast is true closes this.
 * ByteConversionSink
 * @author sgrekhov@unipro.ru
 */
library addSlice_A01_t02;

import "dart:convert";
import "../../../Utils/expect.dart";

test(ChunkedConversionSink create(ByteConversionSink outSink)) {
  bool called = false;
  Utf8Codec codec = new Utf8Codec();
  var encoded = codec.encode("лццц");

  var outSink = new ByteConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(encoded, accumulated);
  });

  ByteConversionSink inSink = create(outSink);
  List<int> list = [0xd0, 0xbb, 0xd0, 0xbb];//лл
  Expect.isFalse(called);
  inSink.addSlice(list, 0, 2, false);
  Expect.isFalse(called);
  list[0] = 0xd1;
  list[1] = 0x86; //ц
  list[2] = 0xd1;
  list[3] = 0x86; //ц
  inSink.addSlice(list, 2, 4, false);
  Expect.isFalse(called);
  inSink.addSlice(list, 0, 4, true);
  Expect.isTrue(called);
}
