/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E last
 * @description Checks that [last] throws exception if [Iterator] is empty.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class NaturalIterator implements Iterator<int> {
  bool moveNext() { return false; }
  int get current => 10;
}

class MyIterable extends Object with IterableMixin {
  MyIterable();
  Iterator<int> get iterator {
    return new NaturalIterator();
  }
}

main() {
  IterableMixin iterable = new MyIterable();
  Expect.throws(() { iterable.last; });
}
