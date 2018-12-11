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
 * @description Checks that [any] returns correct value
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  List _content;

  MyIterable(): _content = new List();

  MyIterable.from(Iterable content): _content = new List.from(content);

  Iterator get iterator {
    return _content.iterator;
  }
}

IterableMixin create([Iterable content]) {
  return new MyIterable.from(content);
}

main() {
  MyIterable iterable = new MyIterable.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  Expect.isTrue(iterable.any((e) => e > 0));
  Expect.isTrue(iterable.any((e) => e < 10));
  Expect.isFalse(iterable.any((e) => e is String));
  Expect.isTrue(iterable.any((e) => e is int));

  iterable = new MyIterable.from([1, 2, 3, 4, 5, "a", "b", "c", "d", "e"]);
  Expect.isTrue(iterable.any((e) => e is String));
  Expect.isTrue(iterable.any((e) => e is int));

  iterable = new MyIterable.from(["a", "b", "c", "d", "e"]);
  Expect.isTrue(iterable.any((e) => e is String));
  Expect.isFalse(iterable.any((e) => e is int));
}
