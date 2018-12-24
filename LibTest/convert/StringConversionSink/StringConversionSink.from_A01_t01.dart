/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StringConversionSink.from(Sink<String> sink)
 * @description Checks that this constructor creates StringConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController<String>();
  dynamic sink = c.sink;

  StringConversionSink outSink = new StringConversionSink.from(sink);

  ByteConversionSink inSink = ascii.decoder.startChunkedConversion(outSink);
  var list = ascii.encode("12345");
  inSink.add(list);
  list = ascii.encode("absdABCD");
  inSink.add(list);
  inSink.close();

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals(["12345", "absdABCD"], x);
    asyncEnd();
  });
  c.close();
}
