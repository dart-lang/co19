/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String listToString(List list)
 * Convert a [List] to a string as [each, element, as, string].
 * @description Checks that this method converts each element to a string,
 * separates results by ", " and wraps in "[" and "]"
 * @author sgrekhov@unipro.ru
 */
import "listbase.lib.dart";
import "dart:collection";
import "../../../Utils/expect.dart";

class C {
  String toString() => "C:toString";
}

main() {
  ListBase list = create(3);
  list[0] = 1;
  list[1] = "2";
  list[2] = new C();

  Expect.equals(
      "[1, 2, " + new C().toString() + "]", ListBase.listToString(list));
}
