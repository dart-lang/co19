/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ClosableStringSink.fromStringSink(StringSink sink, void onClose())
 * Creates a new instance combining a StringSink sink and a callback onClose
 * which is invoked when the returned instance is closed.
 * @description Checks that this constructor creates ClosableStringSink
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
  sink.write("12345");
  Expect.equals("initial:12345", stringSink.toString());
  sink.close();
  Expect.equals("initial:12345:closed", stringSink.toString());
}
