/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * @description Checks that [ArgumentError] is thrown if [index] is [:null:].
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0) {
  UnmodifiableListView a = new UnmodifiableListView(a0);
  Expect.throws(() { a[null]; }, (e) => e is ArgumentError);
}

main() {
  check([]);
  check([1, 2, 3, 4, 5]);
  check(["1", "2", "3", "4", "5"]);
}
