/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(
 *  String string, [
 *  int start = 0,
 *  int end
 *  ])
 * ...
 * If start and end are provided, only the
 * substring string.substring(start, end) is used as input to the conversion.
 * @description Checks that if start and end are provided, only the substring
 * string.substring(start, end) is converted.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  AsciiEncoder encoder = new AsciiEncoder();
  String ascii = "12345";

  Expect.listEquals([49, 50, 51, 52, 53], encoder.convert(ascii));
  Expect.listEquals([50, 51, 52, 53], encoder.convert(ascii, 1));
  Expect.listEquals([50, 51, 52], encoder.convert(ascii, 1, 4));
}
