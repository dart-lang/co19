// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void retainWhere(bool test(E element))
/// The [test] function must not throw or modify the queue.
///
/// @description Checks case when [test] function calls [removeWhere]
///
/// @note See https://github.com/dart-lang/sdk/issues/27920. While spec reads
/// that [test] function must not modify the queue it is expensive to check it
/// every time. So, let's test the current implementation. When element is
/// removed by [retainWhere] it must still be in the queue
/// @author iarkh@unipro.ru
/// @issue 27920

import "dart:collection";
import "../../../Utils/expect.dart";

List list = [1, 3, 3, 4, 5, 6];
DoubleLinkedQueue queue = new DoubleLinkedQueue();

bool test(var element) {
  queue.removeWhere((var element) => element > 5);
  return element > 3;
}

check(bool test(var element), List list, List expected) {
  queue.addAll(list);
  queue.retainWhere(test);
  Expect.equals(expected.length, queue.length);
  int i = 0;
  queue.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}

main() {
  check(test, list, [4, 5]);
}
