/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int indexOf(E element, [int start = 0])
 * Returns the first index of [element] in the list.
 * @description Checks that if [start] is not specified, searches the entire
 * list from the very beginning.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a = new UnmodifiableListView(
      [42, 0, -1, 42, -1, 6031769, 0]);
  Expect.equals(0, a.indexOf(42));
  Expect.equals(1, a.indexOf(0));
  Expect.equals(2, a.indexOf(-1));
  Expect.equals(5, a.indexOf(6031769));
}