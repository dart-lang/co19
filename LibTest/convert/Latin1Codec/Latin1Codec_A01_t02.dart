/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Latin1Codec({bool allowInvalid: false})
 * Instantiates a new Latin1Codec.
 *
 * If allowInvalid is true, the decode method and the converter returned by
 * decoder will default to allowing invalid values. Invalid values are decoded
 * into the Unicode Replacement character (U+FFFD). Calls to the decode method
 * can override this default.
 * @description Checks that this constructor, called with allowInvalid true,
 * creates codec with the decode method allowing invalid values. Invalid values
 * are decoded into the Unicode Replacement character (U+FFFD)
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Codec codec = new Latin1Codec(allowInvalid: true);
  for (int i = 0; i < 256; i++) {
    Expect.equals(new String.fromCharCode(i), codec.decode([i]));
    Expect.listEquals([i], codec.encode(codec.decode([i])));
  }
  for (int i = 256; i <= 65536; i++) {
    Expect.equals("�", codec.decode([i]));
    Expect.throws(() {
      codec.encode(codec.decode([i]));
    });
  }
}
