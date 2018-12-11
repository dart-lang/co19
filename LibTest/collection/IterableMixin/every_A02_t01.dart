/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks every [element] in iteration order
 * @description Checks that elements get checked in the iteration order.
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
  List original = [1, 2, 7, -5, 9, 16, 4];
  List res = [];
  MyIterable iterable = new MyIterable(original);

  iterable.every((var element) {
      res.add(element);
      return true;
    });
  Expect.listEquals(original, res);

  res.clear();
  iterable.every((var element) {
    res.add(element);
    return element > 0;
  });
  Expect.listEquals(res, [1, 2, 7, -5]);

  res.clear();
  iterable.every((var element) {
    res.add(element);
    return element < 10;
  });
  Expect.listEquals(res, [1, 2, 7, -5, 9, 16]);
}
