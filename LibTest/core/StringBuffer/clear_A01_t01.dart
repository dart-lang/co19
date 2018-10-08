/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void clear()
 * Clears the string buffer.
 * @description Checks that this method really clears the buffer
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  sb.clear();
  Expect.equals("", sb.toString());
  
  sb = new StringBuffer("aaa");
  sb.clear();
  Expect.equals("", sb.toString());
  
  sb = new StringBuffer("");
  sb.clear();
  Expect.equals("", sb.toString());

  sb = new StringBuffer();
  sb.writeln("123");
  sb.clear();
  Expect.equals("", sb.toString());
}
