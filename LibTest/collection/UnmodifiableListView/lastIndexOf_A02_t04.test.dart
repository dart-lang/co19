/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  int lastIndexOf(Object element, [ int startIndex ])
 * Returns [-1] if [element] is not found.
 * @description Checks that [-1] is returned, if the [element] presents in the
 * list and [start] index is less than minimum [element] position
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a =
      new UnmodifiableListView([3, 42, 0, -1, 42, -1, 6031769, 0]);
  Expect.equals(-1, a.lastIndexOf(42, 0));
  Expect.equals(-1, a.lastIndexOf(0, 1));
  Expect.equals(-1, a.lastIndexOf(-1, 1));
  Expect.equals(-1, a.lastIndexOf(86031769, 4));
}
