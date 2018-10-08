/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteConversionSink asUtf8Sink(bool allowMalformed)
 * Returns this as a sink that accepts UTF-8 input.
 *
 * If used, this method must be the first and only call to this. It invalidates
 * this. All further operations must be performed on the result.
 * @description Checks that this method returns this as a ByteConversionSink.
 * Test allowMalformed == false
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  bool called = false;
  
  var outSink = new ByteConversionSink.withCallback((accumulated) {
    called = true;
    Expect.listEquals(utf8.encode("1"), accumulated);
  });

  StringConversionSink inSink = utf8.encoder.startChunkedConversion(outSink);
  inSink.add("1");

  ByteConversionSink bcs = inSink.asUtf8Sink(false);
  Expect.throws(() {bcs.add([0x80]);}); // Not valid UTF-8 character
  bcs.close();
  Expect.isTrue(called);
}
