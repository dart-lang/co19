/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(
 *  String input, [
 *  int start = 0,
 *  int end
 *  ])
 *  Converts input and returns the result of the conversion.
 * @description Checks that this method decodes data to base54 code units
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Base64Decoder decoder = new Base64Decoder();
  for (int i = 0; i < 256; i++) {
    String encoded = base64.encode([i]);
    Expect.listEquals([i], decoder.convert(encoded));
  }

  String encoded = "U29tZSBzdHJpbmc=";
  Expect.listEquals("Some string".codeUnits, decoder.convert(encoded));
}
