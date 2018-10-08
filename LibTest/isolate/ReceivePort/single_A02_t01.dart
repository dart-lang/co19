/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> single
 * Returns the single element.
 * If this is empty or has more than one element throws a StateError.
 * @description Checks that a StateError is thrown if this is empty or has more than one element.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(Stream s) {
  asyncStart();
  s.single.then(
    (value){
      Expect.fail("nonexpected: $value");
    },
    onError:(error){
      Expect.isTrue(error is StateError);
      asyncEnd();
    }
  );
}

main() {
  check(IsolateStream.fromIterable([]));
  check(IsolateStream.fromIterable([1,2]));
  check(IsolateStream.fromIterable(new Iterable.generate(0, (int index)=>null)));
  check(IsolateStream.fromIterable(new Iterable.generate(2, (int index)=>null)));
}
