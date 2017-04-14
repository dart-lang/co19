/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Iterates over the given objects and writes them in sequence.
 * @description Checks that this method iterates over the given objects and
 * writes them in sequence. Test separator argument
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
  var toWrite = [new C("test"), "test", 1, 3.14];

  ClosableStringSink sink =
      new ClosableStringSink.fromStringSink(stringSink, () {});
  sink.writeAll(toWrite, ";");
  sink.close();
  Expect.equals("C:test;test;1;3.14", stringSink.toString());
}
