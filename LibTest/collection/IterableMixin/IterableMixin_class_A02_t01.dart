/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IterableMixin<E> abstract class
 * This [Iterable] mixin implements all [Iterable] members except [iterator].
 * @description Checks that this class implements all methods of [Iterable]
 * except [Iterable.iterator]
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "inherited_tests.lib.dart" as allTests;

class MyIterable extends Object with IterableMixin {
  List _content;

  MyIterable(): _content = new List();

  MyIterable.from(Iterable content): _content = new List.from(content);

  Iterator get iterator {
    return _content.iterator;
  }
}

IterableMixin create([Iterable content]) {
  if (content == null) {
    return new MyIterable();
  } else {
    return new MyIterable.from(content);
  }
}  

main() {
  allTests.test(create);
}
