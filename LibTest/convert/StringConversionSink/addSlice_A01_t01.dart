/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addSlice(String chunk, int start, int end, bool isLast)
 * Adds the next chunk to this.
 *
 * Adds the substring defined by start and end-exclusive to this.
 *
 * If isLast is true closes this
 * @description Checks that this method adds data to the StringConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  bool called = false;
  
  var outSink = new ByteConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(utf8.encode("abcde1"), accumulated);
  });

  StringConversionSink inSink = utf8.encoder.startChunkedConversion(outSink);

  inSink.addSlice("12345abcde", 5, 10, false);
  inSink.addSlice("12345abcde", 0, 1, false);
  inSink.close();
  Expect.isTrue(called);
}
