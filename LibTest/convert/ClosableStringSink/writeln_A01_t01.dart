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
 * Object.toString and adds the result to this, followed by a newline.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

class C {
  String value;

  C(this.value);

  String toString() => "C:" + this.value;
}

main() {
  StringBuffer stringSink = new StringBuffer();

  ClosableStringSink sink =
      new ClosableStringSink.fromStringSink(stringSink, () {});
  sink.writeln(new C("123"));
  sink.close();
  Expect.equals("C:123\n", stringSink.toString());
}
