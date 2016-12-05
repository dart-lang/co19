/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a [String] and concatenates the strings.
 * Iterates through elements of this iterable, converts each one to a [String]
 * by calling [Object.toString], and then concatenates the strings, with the
 * [separator] string interleaved between the elements.
 * @description Checks that the method result equals to the specified result.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

String join(DoubleLinkedQueue queue, [String separator = ""]) {
  StringBuffer sb = new StringBuffer();
  bool first = true;
  for (var element in queue) {
    if (first) {
      first = false;
    } else {
      sb.write(separator);
    }
    sb.write(element);
  }
  return sb.toString();
}

void check(List list, [String separator = ""]) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  for(var element in list) {
    queue.addLast(element);
  }
  
  Expect.equals(list.join(separator), join(queue, separator));
}

main() {
  check([]);
  check([], ", ");
  List a0 = ["1", "3", 4, null, 6];
  check(a0);
  check(a0, ":");
  List a1 = new List.from(a0);
  a1.addAll(a0);
  check(a0);
  check(a0, ", ");
}
