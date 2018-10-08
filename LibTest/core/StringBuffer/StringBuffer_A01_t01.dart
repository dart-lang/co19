/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new StringBuffer([Object content = ""])
 * Creates the string buffer with an initial content. 
 * @description Checks that StringBuffer is created with correct content
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("", new StringBuffer().toString());
  Expect.equals("string", new StringBuffer("string").toString());
  Expect.equals("\u0000\u0001", new StringBuffer("\u0000\u0001").toString());
  Expect.equals("", new StringBuffer("").toString());
}
