/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Encoding encoding
 * The [Encoding] used when writing strings. Depending on the underlying
 * consumer this property might be mutable.
 * @description Checks that [encoding] can be changed
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

main() {
  IOSink sink = new IOSink(new StreamController());

  sink.encoding = utf8;
  Expect.equals(utf8, sink.encoding);

  sink.encoding = ascii;
  Expect.equals(ascii, sink.encoding);

  sink.encoding = latin1;
  Expect.equals(latin1, sink.encoding);

  sink.encoding = systemEncoding;
  Expect.equals(systemEncoding, sink.encoding);

  sink.encoding = null;
  Expect.isNull(sink.encoding);

  sink.close();
}
