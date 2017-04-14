/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Writes the charCode to this.
 *
 * This method is equivalent to write(new String.fromCharCode(charCode)).
 * @description Checks that this method  writes the charCode to this.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  for (int i = 0; i < 256; i++) {
    StringBuffer stringSink = new StringBuffer();

    ClosableStringSink sink =
        new ClosableStringSink.fromStringSink(stringSink, () {});

    sink.writeCharCode(i);
    sink.close();
    Expect.equals(new String.fromCharCode(i), stringSink.toString());
  }
}
