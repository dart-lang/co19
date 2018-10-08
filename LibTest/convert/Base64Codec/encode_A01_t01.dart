/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T encode(S input)
 * @description Checks that this method encodes strings to base54 code units
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Base64Codec codec = new Base64Codec();
  Expect.equals("YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo=",
      codec.encode("abcdefghijklmnopqrstuvwxyz".codeUnits));
  Expect.equals("QUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVo=",
      codec.encode("ABCDEFGHIJKLMNOPQRSTUVWXYZ".codeUnits));
  Expect.equals("MDEyMzQ1Njc4OQ==",
      codec.encode("0123456789".codeUnits));
  Expect.equals("", codec.encode([]));
}
