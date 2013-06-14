/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> last
 * If this is empty throws a StateError.
 * @description Checks that a StateError is thrown when this stream is empty.
 * @needsreview #11118
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

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
  check(new Stream.fromIterable([]));
  check(new Stream.fromIterable(new Iterable.generate(0, (int index)=>1)));
}
