/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet<E> class implements Set<E>
 * Removing an element and adding it again, will make it the last element of an
 * iteration.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(LinkedHashSet set, List list) {
  Expect.equals(list.length, set.length);
  for(int i = 0; i < list.length; i++) {
    Expect.equals(list[i], set.elementAt(i));
  }
}

main() {
  LinkedHashSet set = new LinkedHashSet();
  List list = [];

  for (int i = 0; i < 100; i++) {
    set.add(i);
    list.add(i);
  }

  set.remove(13);
  list.removeAt(13);
  checkOrder(set, list);

  set.add(13);
  list.add(13);
  checkOrder(set, list);

  set.clear();
  list.clear();

  for (int i = 0; i < 100; i++) {
    set.add(i);
    list.add(i);
  }

  for (int i = 0; i < 100; i++) {
    set.remove(i);
    list.removeAt(0);
    checkOrder(set, list);
    set.add(i);
    list.add(i);
    checkOrder(set, list);
  }
}
