// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future forEach(Iterable input, dynamic f(element))
///    Perform an async operation for each element of the iterable, in turn.
///    Runs f for each element in input in order, moving to the next element
/// only when the Future returned by f completes.
/// @description Checks that Future returned by [f] is completed before next
/// element is processed
/// @author a.semenov@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

void check(List input) {
  List log = [];

  dynamic f(element) {
    log.add("start");
    try {
      log.add(element);
      return new Future.value(null);
    } finally {
      log.add("finish");
    }
  }

  asyncStart();
  List expected = input.expand((e)=>["start", e, "finish"]).toList();
  Future.forEach(input, f).then((_) {
    Expect.listEquals(expected, log);
    asyncEnd();
  });
}

main() {
  asyncStart();
  check([0, 1, 2, 3, 4]);
  check(["a", "b", "c", "d"]);
  check([]);
  check([0, null, "a", 3.14, true, false]);
  asyncEnd();
}
