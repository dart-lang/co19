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
 * Object.toString and adds the result to this, followed by a newline. test
 * default argument
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  StringBuffer stringSink = new StringBuffer();

  ClosableStringSink sink =
      new ClosableStringSink.fromStringSink(stringSink, () {});
  sink.writeln();
  sink.close();
  Expect.equals("\n", stringSink.toString());
}
