/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decode(List<int> codeUnits, {bool allowMalformed})
 * Decodes the UTF-8 codeUnits (a list of unsigned 8-bit integers) to the
 * corresponding string.
 * ...
 * If allowMalformed is not given, it defaults to the allowMalformed that was
 * used to instantiate this.
 * @description Checks that If allowMalformed is not given, it defaults to the
 * allowMalformed that was used to instantiate this.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Codec codec = new Utf8Codec(allowMalformed: true);
  Expect.equals("�", codec.decode([0xFE]));

  codec = new Utf8Codec(allowMalformed: false);
  Expect.throws(() {codec.decode([0xFE]);}, (e) => e is FormatException);
}
