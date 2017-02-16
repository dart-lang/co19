/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  int lastIndexOf(Object element, [ int startIndex ])
 * Returns [-1] if [element] is not found.
 * @description Checks that [-1] is returned, if the [element] does not present
 * in the list and [startIndex] is specified and [startIndex] is less then the
 * list length
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a =
      new UnmodifiableListView([42, 0, -1, 42, -1, 6031769, 0]);
  Expect.equals(-1, a.lastIndexOf(3.14, 3));
  Expect.equals(-1, a.lastIndexOf(null, 2));
  Expect.equals(-1, a.lastIndexOf(a, 4));
  Expect.equals(-1, a.lastIndexOf(8, 14));
}
