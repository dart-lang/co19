/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [obj] to the buffer.
 * @description Checks that the String argument is appended to the buffer
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";


main() {
  StringBuffer sb = new StringBuffer();
  sb.add("buffer");
  Expect.equals("buffer", sb.toString());

  sb.add("");
  Expect.equals("buffer", sb.toString());

  sb.add(sb.toString());
  Expect.equals("bufferbuffer", sb.toString());

  sb.add("\u0000");
  Expect.equals("bufferbuffer\u0000", sb.toString());
}
