/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * The [index] must be non-negative and less than [length].
 * @description Checks that [RangeError] is thrown for [index] which is negative
 * or more than [length].
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
  Expect.throws (() { iterable.elementAt(-1); }, (e) => e is RangeError);
  Expect.throws (() { iterable.elementAt(9); }, (e) => e is RangeError);
  Expect.throws (() { iterable.elementAt(10); }, (e) => e is RangeError);
  Expect.throws (() { iterable.elementAt(100); }, (e) => e is RangeError);
}
