/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts obj to a String by invoking Object.toString and adds the result to
 * this, followed by a newline.
 * @description Checks that this method adds a newline to the appended string
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  sb.writeln("123");
  Expect.equals("123\n", sb.toString());

  sb.writeln(null);
  Expect.equals("123\nnull\n", sb.toString());

  sb.writeln("\n");
  Expect.equals("123\nnull\n\n\n", sb.toString());
}
