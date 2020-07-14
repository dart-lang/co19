/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int indexOf(Object element, [ int startIndex = 0 ])
 * Searches the list from index [start] to the end of the list. The first time
 * an object [o] is encountered so that [o == element], the index of [o] is
 * returned.
 * @description Checks that correct index is returned if the element presents in
 * the list
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a = new UnmodifiableListView(
      [42, 0, -1, 42, -1, 6031769, 0]);
    
  Expect.equals(0, a.indexOf(42, 0));
  Expect.equals(1, a.indexOf(0, 0));
  Expect.equals(3, a.indexOf(42, 1));
  Expect.equals(3, a.indexOf(42, 3));
  Expect.equals(5, a.indexOf(6031769, 5));
  Expect.equals(5, a.indexOf(6031769, 0));
  Expect.equals(1, a.indexOf(0, 1));
  Expect.equals(6, a.indexOf(0, 2));
  Expect.equals(6, a.indexOf(0, 5));
  Expect.equals(6, a.indexOf(0, 6));
}
