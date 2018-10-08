/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sort([Comparator compare ])
 * This operation is not supported by an unmodifiable list.
 * @description Checks that [sort] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

int c(var a, var b) {
  return a < b ? -1 : (a == b ? 0 : 1);
}

main() {
  UnmodifiableListView l = new UnmodifiableListView([1, 2, 3, 4, 5]);
  Expect.throws(() { l.sort(null); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.sort(c); }, (e) => e is UnsupportedError);
}
