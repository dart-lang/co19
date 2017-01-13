/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Adds the contents of obj, converted to a string, to the buffer.
 * @description Checks that the String argument is appended to the buffer
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  sb.write("buffer");
  Expect.equals("buffer", sb.toString());

  sb.write("");
  Expect.equals("buffer", sb.toString());

  sb.write(sb.toString());
  Expect.equals("bufferbuffer", sb.toString());

  sb.write("\u0000");
  Expect.equals("bufferbuffer\u0000", sb.toString());
}
