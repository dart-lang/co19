/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const IterableBase()
 * This class implements all methods of [Iterable] except [Iterable.iterator]
 * in terms of iterator.
 * @description Checks that this class implements all methods of [Iterable]
 * except [Iterable.iterator]
 * @author kaigorodov
 */
import "dart:collection";
import "inherited_tests.lib.dart" as allTests;

class MyIterable extends IterableBase {
  List _content;

  MyIterable(): _content = new List();

  MyIterable.from(Iterable content): _content = new List.from(content);

  Iterator get iterator {
    return _content.iterator;
  }
}
    
IterableBase create([Iterable content]) {
  if (content == null) {
    return new MyIterable();
  } else {
    return new MyIterable.from(content);
  }
}  

main() {
  allTests.test(create);
}
