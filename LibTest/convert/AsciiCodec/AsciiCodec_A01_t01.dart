/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const AsciiCodec({bool allowInvalid: false})
 * Instantiates a new AsciiCodec.
 *
 * If allowInvalid is true, the decode method and the converter returned by
 * decoder will default to allowing invalid values. If allowing invalid values,
 * the values will be decoded into the Unicode Replacement character (U+FFFD).
 * If not, an exception will be thrown. Calls to the decode method can choose to
 * override this default.
 * @description Checks that this constructor, called without parameters,
 * instantiates a new AsciiCodec with decoder which doesn't allow invalid
 * values
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(AsciiCodec codec) {
  for (int i = 0; i < 128; i++) {
    Expect.equals(new String.fromCharCode(i), codec.decode([i]));
    Expect.listEquals([i], codec.encode(codec.decode([i])));
  }
  for (int i = 128; i <= 65536; i++) {
    Expect.throws(() {
      codec.decode([i]);
    });
  }
}

main() {
  check(new AsciiCodec());
  check(new AsciiCodec(allowInvalid: false));
}
