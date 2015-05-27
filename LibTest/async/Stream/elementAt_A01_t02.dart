/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 * Stops listening to the stream after a value has been found.
 * @description Checks that it stops listening to the stream after a value has
 * been found.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

var index=5;

f(i) {
  if (i > index) {
    Expect.fail('Subscription is not cancelled');
  }
}

main() {
  var s = new Stream.fromIterable(new Iterable.generate(100, f));
  s.elementAt(index).then((_) {
    asyncEnd();
  });
  asyncStart();
}
