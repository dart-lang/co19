/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E value), {Object orElse()})
 * If [orElse] is omitted, it defaults to throwing a [StateError].
 * @description Checks that [StateError] is thrown when [orElse] is null and
 * none matches.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List list) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  Expect.throws(() { queue.lastWhere((var value) => false); },
    (e) => e is StateError);
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
  check([1, 2, 3]);
}
