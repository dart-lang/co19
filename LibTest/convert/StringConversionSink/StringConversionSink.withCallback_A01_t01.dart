/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StringConversionSink.withCallback(
 *  void callback(String accumulated)
 * )
 * @description Checks that this constructor creates StringConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  bool called = false;

  var outSink = new StringConversionSink.withCallback((accumulated) {
    called = true;
    Expect.equals("12345absdABCD", accumulated);
  });

  ByteConversionSink inSink = ascii.decoder.startChunkedConversion(outSink);
  var list = ascii.encode("12345");
  inSink.add(list);
  list = ascii.encode("absdABCD");
  inSink.add(list);
  inSink.close();
  Expect.isTrue(called);
}
