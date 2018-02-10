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
import "dart:convert";
import "dart:io";

test(Stdout sink) {
  sink.encoding = UTF8;
  Expect.equals(UTF8, sink.encoding);

  sink.encoding = ASCII;
  Expect.equals(ASCII, sink.encoding);

  sink.encoding = LATIN1;
  Expect.equals(LATIN1, sink.encoding);

  sink.encoding = SYSTEM_ENCODING;
  Expect.equals(SYSTEM_ENCODING, sink.encoding);

  sink.encoding = null;
  Expect.isNull(sink.encoding);
}

main() {
  test(stderr);
  test(stdout);
}