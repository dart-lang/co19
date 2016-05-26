/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * Creates a new stream with the same events as this stream.
 *
 * @description Check that timeout creates a new stream with the same events as
 * this stream.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable<int> data) {
  Iterator<int> it = data.iterator;
  Stream s1 = new Stream.fromIterable(data);
  Stream s2 = s1.timeout(new Duration(microseconds: 1));

  asyncStart();

  s2.listen((int event) {
    Expect.isTrue(it.moveNext());
    Expect.equals(it.current, event);
  }, onError: (error) {
    Expect.fail("onError($error) called unexpectedly");
  }, onDone: () {
    Expect.isFalse(it.moveNext());
    asyncEnd();
  });
}

main() {
  check([]);
  check([1, 2, 3, null]);
  check(new Iterable.generate(10, (int index) => index * 2));
}
