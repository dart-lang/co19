/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> entries)
 * Throws [Error] if [collection] is [:null:].
 * @note undocumented
 * @description Checks that the exception is thrown as expected.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  Expect.throws(() {
      new LinkedList<MyLinkedListEntry>().addAll(null);
    }, (e) => e is Error);
}
