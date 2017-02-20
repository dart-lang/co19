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
 * @description Checks that this constructor with allowMalformed: true creates
 * Utf8Codec which doesn't throw FormatException for invalid or unterminated
 * character sequences but replaces them by Replacement character U+FFFD (�)
 * Invalid characters taken from
 * http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-test.txt
 * @issue 28832
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(List<int> toDecode, String expected) {
  Utf8Codec codec = new Utf8Codec(allowMalformed: true);
  Expect.equals(expected, codec.decode(toDecode));
}

main() {
  //Sequence of all 64 possible continuation bytes (0x80-0xBF)
  for (int i = 0x80; i <= 0xBF; i++) {
    check([i], "�");
  }

  // All 32 first bytes of 2-byte sequences (0xc0-0xdf)
  for (int i = 0xc0; i <= 0xdf; i++) {
    check([i], "�");
  }

  // All 16 first bytes of 3-byte sequences (0xe0-0xef)
  for (int i = 0xe0; i <= 0xef; i++) {
    check([i], "�");
  }

  // All 8 first bytes of 4-byte sequences (0xf0-0xf7)
  for (int i = 0xf0; i <= 0xf7; i++) {
    check([i], "�");
  }

  // All 4 first bytes of 5-byte sequences (0xf8-0xfb)
  for (int i = 0xf8; i <= 0xfb; i++) {
    check([i], "�");
  }

  // All 2 first bytes of 6-byte sequences (0xfc-0xfd)
  for (int i = 0xfc; i <= 0xfd; i++) {
    check([i], "�");
  }

  // The following two bytes cannot appear in a correct UTF-8 string
  check([0xFE], "�");
  check([0xFF], "�");
  check([0xFE, 0xFE, 0xFF, 0xFF], "����");

  // Overlong ASCII character
  check([0xc0, 0xaf], "�");
  check([0xe0, 0x80, 0xaf], "�");
  check([0xf0, 0x80, 0x80, 0xaf], "�");
  check([0xf8, 0x80, 0x80, 0x80, 0xaf], "�����");
  check([0xfc, 0x80, 0x80, 0x80, 0x80, 0xaf], "������");

  // Maximum overlong sequences
  check([0xc1, 0xBF], "�");
  check([0xe0, 0x9f, 0xBF], "�");
  check([0xf0, 0x8f, 0xBF, 0xBF], "�");
  check([0xf8, 0x87, 0xBF, 0xBF, 0xBF], "�����");
  check([0xfc, 0x83, 0xBF, 0xBF, 0xBF, 0xBF], "������");

  // Overlong representation of the NUL character
  check([0xC0, 0x80], "�");
  check([0xE0, 0x80, 0x80], "�");
  check([0xF0, 0x80, 0x80, 0x80], "�");
  check([0xF8, 0x80, 0x80, 0x80, 0x80], "�����");
  check([0xFC, 0x80, 0x80, 0x80, 0x80, 0x80], "������");

  // Single UTF-16 surrogates
  check([0xED, 0xA0, 0x80], "�");
  check([0xED, 0xAD, 0xBF], "�");
  check([0xED, 0xAD, 0x80], "�");
  check([0xED, 0xAF, 0xBF], "�");
  check([0xED, 0xB0, 0x80], "�");
  check([0xED, 0xBE, 0x80], "�");
  check([0xED, 0xBF, 0xBF], "�");

  // Paired UTF-16 surrogates
  check([0xED, 0xA0, 0x80, 0xED, 0xB0, 0x80], "�");
  check([0xED, 0xA0, 0x80, 0xED, 0xBF, 0xBF], "�");
  check([0xED, 0xAD, 0xBF, 0xED, 0xB0, 0x80], "�");
  check([0xED, 0xAD, 0xBF, 0xED, 0xBF, 0xBF], "�");
  check([0xED, 0xAE, 0x80, 0xED, 0xB0, 0x80], "�");
  check([0xED, 0xAE, 0x80, 0xED, 0xBF, 0xBF], "�");
  check([0xED, 0xAF, 0xBF, 0xED, 0xB0, 0x80], "�");
  check([0xED, 0xAF, 0xBF, 0xED, 0xBF, 0xBF], "�");
}
