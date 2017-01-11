/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Adds the string representation of charCode to the buffer.
 * @description Checks that the String argument is appended to the buffer
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  sb.writeCharCode(0x61); // a
  Expect.equals("a", sb.toString());

  sb.writeCharCode(0x20); // Space
  Expect.equals("a ", sb.toString());

  sb.writeCharCode(0x6A); // j
  Expect.equals("a j", sb.toString());
}
