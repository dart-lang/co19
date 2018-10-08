/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Closes this and flushes any outstanding data.
 * @description Checks that this method closes this and flushes any outstanding
 * data
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  StringBuffer stringSink = new StringBuffer();
  stringSink.write("initial:");

  ClosableStringSink sink =
      new ClosableStringSink.fromStringSink(stringSink, () {
        stringSink.write(":closed");
      });
  sink.write("1");
  Expect.equals("initial:1", stringSink.toString());
  sink.close();
  Expect.equals("initial:1:closed", stringSink.toString());
  sink.write(":2");
  sink.close();
  Expect.equals("initial:1:closed:2:closed", stringSink.toString());
}
