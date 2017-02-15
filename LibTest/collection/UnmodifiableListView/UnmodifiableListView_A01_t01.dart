/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UnmodifiableListView(Iterable<E> source)
 * Creates an unmodifiable list backed by [source].
 * The [source] of the elements may be a [List] or any [Iterable] with efficient
 * [Iterable.length] and [Iterable.elementAt].
 * @description Checks that proper unmodifiable list with correct element order
 * is created from the list [source]
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable i) {
  UnmodifiableListView l = new UnmodifiableListView(i);
  Expect.listEquals(l, i);
}

main() {
  check([]);
  check([1, 2, 3, 4, 5]);
  check(["1", "2", 3, null, 5, 0, "test"]);
}
