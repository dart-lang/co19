/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the [index]th element.
 * @description Checks that the [index]th element is returned.
 * ...
 * Index zero represents the first element (so [iterable.elementAt(0)] is
 * equivalent to [iterable.first]).
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  List a = [5, 4, 3, 2, 1, 0];
  LinkedList<MyLinkedListEntry> b = toLinkedList(a);
  for (int k = 0; k < a.length; k++) {
    Expect.equals(a[k], b.elementAt(k).value);
  }
}
