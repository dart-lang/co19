/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String setToString(Set set)
 * Convert a [Set] to a string as [{each, element, as, string}].
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
  SetBase set = create();
  set.add(1);
  set.add("2");
  set.add(new C());

  Expect.equals("{1, 2, " + new C().toString() + "}", SetBase.setToString(set));
}

