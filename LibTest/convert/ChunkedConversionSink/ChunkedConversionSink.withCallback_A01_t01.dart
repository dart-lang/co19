/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ChunkedConversionSink.withCallback(
 *  void callback(List<T> accumulated)
 *  )
 * @description Checks that this constructor creates ChunkedConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  bool called = false;

  var outSink = new ChunkedConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(["Кириллица", "прекрасна"], accumulated);
  });

  ByteConversionSink inSink = UTF8.decoder.startChunkedConversion(outSink);
  var list = UTF8.encode("Кириллица");
  inSink.add(list);
  list = UTF8.encode("прекрасна");
  inSink.add(list);
  inSink.close();
  Expect.isTrue(called);
}