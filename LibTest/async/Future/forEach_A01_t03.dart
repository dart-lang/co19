// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future forEach(Iterable input, Future f(element))
///    Perform an async operation for each element of the iterable, in turn.
///    Runs f for each element in input in order, moving to the next element
/// only when the Future returned by f completes.
/// @description Checks that if [f] returns a not completed Future, [forEach]
/// waits for the returned Future to complete.
/// @author a.semenov@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

void check(List input) {
  List log = [];

  dynamic f(element) {
    log.add(element);
    return new Future.delayed(durationInMilliseconds(100));
  }

  asyncStart();
  Future.forEach(input, f).then((_) {
    Expect.listEquals(input, log);
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
