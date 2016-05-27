/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String setToString(Set set)
 * ...
 * Handles circular references where converting one of the elements to a string
 * ends up converting set to a string again.
 * @description Checks that this method converts each element to a string,
 * separates results by ", " and wraps in "{" and "}"
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "SetBase.lib.dart";
import "../../../Utils/expect.dart";

class C {
  String toString() => "C:toString";
}

main() {
  SetBase set1 = create();
  SetBase set2 = create();

  set2.add(3);
  set2.add(new C());

  set1.add(1);
  set1.add("2");
  set1.add(new C());
  set1.add(set2);

  Expect.equals("{1, 2, " + new C().toString() + ", {3, " + new C().toString()
      + "}}", SetBase.setToString(set1));
}

