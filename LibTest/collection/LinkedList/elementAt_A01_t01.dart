/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  List a=[5, 4, 3, 2, 1, 0];
  LinkedList<MyLinkedListEntry> b=toLinkedList(a);
  for (int k=0; k<a.length; k++) {
    Expect.equals(a[k], b.elementAt(k).value);
  }
}
