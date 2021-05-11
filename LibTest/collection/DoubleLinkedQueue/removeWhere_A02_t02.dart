// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void removeWhere(bool test(E element))
/// The [test] function must not throw or modify the queue.
///
/// @description Checks case when test function removes some element from the
/// queue.
///
/// @note See https://github.com/dart-lang/sdk/issues/27920. While spec reads
/// that [test] function must not modify the queue it is expensive to check it
/// every time. So, let's test the current implementation. When element is
/// removed by [removeWhere] it must still be in the queue
/// @author iarkh@unipro.ru
/// @issue 27920

import "dart:collection";
import "../../../Utils/expect.dart";

DoubleLinkedQueue? queue;

bool testRemoveFirst1(var element) {
  queue?.removeFirst();
  return false;
}

bool testRemoveFirst2(var element) {
  queue?.removeFirst();
  return true;
}

bool testRemove(var element) {
  queue?.remove(4);
  return element >= 3;
}

bool testRemove1(var element) {
  queue?.remove(1);
  return element > 3;
}

bool testRemoveUnexistent(var element) {
  queue?.remove(18);
  return element <= 4;
}

check(bool test(var element), List list, List expected, bool expectError) {
  queue = new DoubleLinkedQueue.from(list);
  if (expectError) {
    Expect.throws(() {
      queue?.removeWhere(test);
    });
  } else {
    queue?.removeWhere(test);
    Expect.equals(expected.length, queue?.length);
    int i = 0;
    queue?.forEach((var element) {
      Expect.equals(expected[i++], element);
    });
  }
}

main() {
  List list = [1, 3, 3, 4, 6, 5];

  check(testRemove, list, [1], false);
  check(testRemove1, list, [3, 3], true);
  check(testRemoveUnexistent, list, [6, 5], false);
  check(testRemoveFirst1, list, [], true);
  check(testRemoveFirst2, list, [], true);
}
