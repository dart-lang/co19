/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the [index]th element.
 * @description Checks that [elementAt] returns element from the given [index].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

main() {
  MyIterable iterable = new MyIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  for(int i = 0; i < 8; i++) {
    Expect.equals(i + 1, iterable.elementAt(i));
  }
}
