/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Encoding encoding
 * The Encoding used when writing strings. Depending on the underlying consumer
 * this property might be mutable.
 * @description Checks that [encoding] can be changed
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

main() {
  IOSink sink = new IOSink(new StreamController());

  Encoding enc = new Utf8Codec();
  sink.encoding = enc;
  Expect.equals(enc, sink.encoding);

  enc = new AsciiCodec();
  sink.encoding = enc;
  Expect.equals(enc, sink.encoding);

  enc = new Latin1Codec();
  sink.encoding = enc;
  Expect.equals(enc, sink.encoding);

  enc = new SystemEncoding();
  sink.encoding = enc;
  Expect.equals(enc, sink.encoding);
}
