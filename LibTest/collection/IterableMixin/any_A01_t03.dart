/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  bool any(bool f(E element))
 * Checks whether any [element] of this iterable satisfies [test].
 * Checks every [element] in iteration order, and returns [true] if any of them
 * make [test] return [true], otherwise returns [false].
 * @description Checks that for empty [IterableMixi] [any] always returns
 * [false]
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(): _content = new List();
  Iterator get iterator {
    return _content.iterator;
  }
}

main() {
  MyIterable iterable = new MyIterable();
  Expect.isFalse(iterable.any((e) => e > 0));
  Expect.isFalse(iterable.any((e) => e < 10));
  Expect.isFalse(iterable.any((e) => e is String));
  Expect.isFalse(iterable.any((e) => e is int));
}
