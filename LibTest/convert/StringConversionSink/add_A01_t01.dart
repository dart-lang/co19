/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T chunk)
 * Adds chunked data to this sink.
 *
 * This method is also used when converters are used as StreamTransformers.
 * @description Checks that this method adds data to the StringConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  bool called = false;
  
  var outSink = new ByteConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(utf8.encode("Кириллица прекрасна"), accumulated);
  });

  StringConversionSink inSink = utf8.encoder.startChunkedConversion(outSink);

  inSink.add("Кириллица");
  inSink.add(" прекрасна");
  inSink.close();
  Expect.isTrue(called);
}
