/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Iterates over the given objects and writes them in sequence.
 * @description Checks that all items are appended to the buffer if the
 * collection isn't empty and none are if it is.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();

  sb.writeAll([ "string1", ", ", "string2", ", ", "string3" ]);
  Expect.equals("string1, string2, string3", sb.toString());

  sb.writeAll([]);
  Expect.equals("string1, string2, string3", sb.toString());
}
