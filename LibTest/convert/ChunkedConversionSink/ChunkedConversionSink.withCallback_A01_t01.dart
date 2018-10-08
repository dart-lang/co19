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

  Sink<String> outSink = new ChunkedConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(["Кириллица", "прекрасна"], accumulated);
  });

  ByteConversionSink inSink = utf8.decoder.startChunkedConversion(outSink);
  var list = utf8.encode("Кириллица");
  inSink.add(list);
  list = utf8.encode("прекрасна");
  inSink.add(list);
  inSink.close();
  Expect.isTrue(called);
}