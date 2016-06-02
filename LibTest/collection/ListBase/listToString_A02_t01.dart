/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String listToString(List list)
 * ...
 * Handles circular references where converting one of the elements to a string
 * ends up converting list to a string again.
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
  ListBase list1 = create(4);
  ListBase list2 = create(2);
  list2[0] = 3;
  list2[1] = new C();

  list1[0] = 1;
  list1[1] = "2";
  list1[2] = list2;
  list1[3] = new C();

  Expect.equals("[1, 2, [3, " + new C().toString() + "], " + new C().toString()
      + "]", ListBase.listToString(list1));
}
