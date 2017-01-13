/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts obj to a String by invoking Object.toString and adds the result to
 * this, followed by a newline.
 * @description Checks that this method converts obj to a String by invoking
 * Object.toString and adds the result to this, followed by a newline
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  String toString() => "C";
}

main() {
  StringBuffer sb = new StringBuffer();
  sb.writeln("123");
  Expect.equals("123\n", sb.toString());

  sb.writeln(null);
  Expect.equals("123\nnull\n", sb.toString());

  sb.writeln(1);
  Expect.equals("123\nnull\n1\n", sb.toString());

  sb.writeln(true);
  Expect.equals("123\nnull\n1\ntrue\n", sb.toString());

  sb.writeln(new C());
  Expect.equals("123\nnull\n1\ntrue\nC\n", sb.toString());
}
