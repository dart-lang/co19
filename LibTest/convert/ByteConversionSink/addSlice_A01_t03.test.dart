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
library addSlice_A01_t03;

import "dart:convert";
import "../../../Utils/expect.dart";

test(ChunkedConversionSink create(ByteConversionSink outSink)) {
  bool called = false;
  
  var outSink = new ByteConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals([], accumulated);
  });

  ByteConversionSink inSink = create(outSink);
  List<int> list = [0xd0, 0xbb, 0xd0, 0xbb];//лл
  inSink.addSlice(list, 0, 0, false);
  inSink.addSlice(list, 2, 2, false);
  inSink.addSlice(list, 4, 4, true);
  Expect.isTrue(called);
}
