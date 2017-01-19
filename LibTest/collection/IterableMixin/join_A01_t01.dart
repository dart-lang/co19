/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = "" ])
 * Converts each element to a [String] and concatenates the strings.
 * Iterates through elements of this iterable, converts each one to a [String]
 * by calling [Object.toString], and then concatenates the strings, with the
 * [separator] string interleaved between the elements.
 * @description Checks that result of [join] method call is a concatination of
 * the string representations of all the iterable objects.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

void check(List list, [String separator = ""]) {
  IterableMixin iterable = new MyIterable(list);
  Expect.equals(list.join(), iterable.join());
  Expect.equals(list.join(separator), iterable.join(separator));
}

main() {
  check([], ", ");
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "@");
  check(["1", "3", 4, null, 6, new Error(), "@", null, [], [1, 2, 3], -2], "@");
}
