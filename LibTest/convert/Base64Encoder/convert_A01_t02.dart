/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String convert(List<int> input)
 * Converts input and returns the result of the conversion.
 * @description Checks that this method converts input and returns the result of
 * the conversion. Test URL safe encoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Base64Encoder encoder = new Base64Encoder.urlSafe();
  Expect.equals("YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo=",
      encoder.convert("abcdefghijklmnopqrstuvwxyz".codeUnits));
  Expect.equals("QUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVo=",
      encoder.convert("ABCDEFGHIJKLMNOPQRSTUVWXYZ".codeUnits));
  Expect.equals("MDEyMzQ1Njc4OQ==",
      encoder.convert("0123456789".codeUnits));
  Expect.equals("", encoder.convert([]));
}
