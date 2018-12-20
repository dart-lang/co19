/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteConversionSink.from(Sink<List<int>> sink)
 * @description Checks that this constructor creates ByteConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController<List<int>>();
  dynamic sink = c.sink;

  ByteConversionSink outSink = new ByteConversionSink.from(sink);

  StringConversionSink inSink = utf8.encoder.startChunkedConversion(outSink);
  inSink.add("Кириллица");
  inSink.add("прекрасна");
  inSink.close();

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals([utf8.encode("Кириллица"), utf8.encode("прекрасна")], x);
    asyncEnd();
  });
  c.close();
}
