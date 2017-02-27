/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Utf8Codec({bool allowMalformed: false})
 * Instantiates a new Utf8Codec.
 *
 * The optional allowMalformed argument defines how decoder (and decode) deal
 * with invalid or unterminated character sequences.
 *
 * If it is true (and not overridden at the method invocation) decode and the
 * decoder replace invalid (or unterminated) octet sequences with the Unicode
 * Replacement character U+FFFD (�). Otherwise they throw a FormatException.
 * @description Checks that this constructor creates valid Utf8Codec
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Utf8Codec codec, String toEncode, var expected) {
  var encoded = codec.encode(toEncode);
  Expect.deepEquals(expected, encoded);
  Expect.equals(toEncode, codec.decode(encoded));
}

main() {
  Utf8Codec codec = new Utf8Codec();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    check(codec, s, [i]);
  }
  check(codec, "Кириллица ", [208, 154, 208, 184, 209, 128, 208, 184, 208, 187,
    208, 187, 208, 184, 209, 134, 208, 176, 32]);

  codec = new Utf8Codec(allowMalformed: false);
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    check(codec, s, [i]);
  }
  check(codec, "Кириллица ", [208, 154, 208, 184, 209, 128, 208, 184, 208, 187,
    208, 187, 208, 184, 209, 134, 208, 176, 32]);
}
