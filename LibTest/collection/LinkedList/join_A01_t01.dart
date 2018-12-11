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
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

String join(LinkedList<MyLinkedListEntry> a, [String separator = ""]) {
  StringBuffer sb = new StringBuffer();
  bool first = true;
  for (var element in a) {
    if (first) {
      first = false;
    } else {
      sb.write(separator);
    }
    sb.write(element);
  }
  return sb.toString();
}

void check(LinkedList a, [String separator = ""]) {
  Expect.equals(a.join(separator), join(a, separator));
}

main() {
  check(new LinkedList<MyLinkedListEntry>());
  check(new LinkedList<MyLinkedListEntry>(), ", ");
  LinkedList<MyLinkedListEntry> a0 = toLinkedList(["1", "3", 4, null, 6]);
  check(a0);
  check(a0, ":");
  a0.addAll([1.0, 3.14].map((e) => new MyLinkedListEntry(e)));
  check(a0);
  check(a0, ", ");
}
