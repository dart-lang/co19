/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 * @description Checks that the future returns the value of the indexth data event of this stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VAL=123;

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(Stream s, int index, var expected) {
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  asyncStart();
  ets.elementAt(index).then((actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check(new Stream.fromFuture(new Future.sync(() => VAL)), 0, VAL);
  check(new Stream.fromFuture(new Future(() => VAL)), 0, VAL);
  
  // using completable future
  Completer completer = new Completer();
  check(new Stream.fromFuture(completer.future), 0, VAL);
  completer.complete(VAL);

  // using fromIterable
  check(new Stream.fromIterable([1, VAL, 2, 3]), 1, VAL);

  for (int k=0; k<10; k++) {
    Stream s=new Stream.fromIterable(new Iterable.generate(10, (int index)=>index));
    check(s, k, k);
  }
}

