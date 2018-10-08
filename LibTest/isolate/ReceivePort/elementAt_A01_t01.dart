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
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

const VAL=123;

void check(Stream s, int index, var expected) {
  asyncStart();
  s.elementAt(index).then((actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check(IsolateStream.fromFuture(new Future.sync(() => VAL)), 0, VAL);
  check(IsolateStream.fromFuture(new Future(() => VAL)), 0, VAL);
  
  // using completable future
  Completer completer = new Completer();
  check(IsolateStream.fromFuture(completer.future), 0, VAL);
  completer.complete(VAL);

  // using fromIterable
  check(IsolateStream.fromIterable([1, VAL, 2, 3]), 1, VAL);

  for (int k=0; k<10; k++) {
    Stream s=IsolateStream.fromIterable(new Iterable.generate(10, (int index)=>index));
    check(s, k, k);
  }
}

