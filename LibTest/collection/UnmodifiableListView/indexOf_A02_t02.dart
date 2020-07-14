/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int indexOf(E element, [int start = 0])
 * Searches the list from index [start] to the end of the list. The first time
 * an object [o] is encountered so that [o == element], the index of [o] is
 * returned.
 * @description Checks that [start] can be out of bounds.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a =
      new UnmodifiableListView([42, 0, -1, 42, -1, 6031769, 0]);
  Expect.equals(-1, a.indexOf(777, -1));
  Expect.equals(0, a.indexOf(42, -1));
  Expect.equals(-1, a.indexOf(null, -1));
  Expect.equals(2, a.indexOf(-1, -1));

  Expect.equals(-1, a.indexOf(777, 7));
  Expect.equals(-1, a.indexOf(42, 7));
  Expect.equals(-1, a.indexOf(null, 7));
  Expect.equals(-1, a.indexOf(-1, 7));

  Expect.equals(-1, a.indexOf(42, 6031769));
  Expect.equals(-1, a.indexOf(777, 6031769));
  Expect.equals(-1, a.indexOf(null, 6031769));
  Expect.equals(-1, a.indexOf(0, 6031769));

  Expect.equals(0, a.indexOf(42, -6031769));
  Expect.equals(-1, a.indexOf(777, -6031769));
  Expect.equals(-1, a.indexOf(null, -6031769));
  Expect.equals(1, a.indexOf(0, -6031769));
}
