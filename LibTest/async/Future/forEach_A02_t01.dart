/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, dynamic f(element))
 * Returns a Future that completes when all elements have been processed.
 * @description Checks that returned future completes when all elements have
 * been processed.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

void check(List input){
  List<Completer> c = new List.generate(input.length, (_) => new Completer());
  int k = 0;

  dynamic f(element) {
    return c[k++].future;
  }

  asyncStart();
  Future.forEach(input, f).then(
    (_) {
      Expect.isTrue(c.fold(true, (bool v, Completer x) => v && x.isCompleted));
      asyncEnd();
    }
  );
  // complete the futures in reverse order
  c.reversed.forEach((Completer x) => x.complete(null));
}

main() {
  check([0, 1, 2, 3, 4]);
  check(["a", "b", "c", "d"]);
  check([]);
  check([0, null, "a", 3.14, true, false]);
}
