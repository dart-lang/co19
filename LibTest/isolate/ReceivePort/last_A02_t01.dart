/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> last
 * If this stream is empty (a done event occurs before the first data event),
 * the resulting future completes with a StateError.
 * @description Checks that future completes with a StateError when this
 * stream is empty.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(Stream s) {
  asyncStart();
  s.last.then(
    (value){
      Expect.fail("empty stream returned $value");
    },
    onError:(error){
      Expect.isTrue(error is StateError);
      asyncEnd();
    }
  );
}

main() {
  check(IsolateStream.fromIterable([]));
  check(IsolateStream.fromIterable(new Iterable.generate(0, (int index)=>1)));
}
