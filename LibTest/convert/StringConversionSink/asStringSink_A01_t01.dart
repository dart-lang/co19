/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ClosableStringSink asStringSink()
 * Returns this as a ClosableStringSink.
 *
 * If used, this method must be the first and only call to this. It invalidates
 * this. All further operations must be performed on the result.
 * @description Checks that this method returns this as a ClosableStringSink
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

  ClosableStringSink css = inSink.asStringSink();
  css.write(" прекрасна");
  css.close();
  Expect.isTrue(called);
}
