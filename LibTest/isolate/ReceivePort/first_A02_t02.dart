/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * If this stream is empty (a done event occurs before the first data event),
 * the resulting future completes with a StateError.
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 * @description Checks that for non-empty stream, this.first is equivalent to this.elementAt(0).
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

const VAL=123;

void check(Stream s) {
  asyncStart();
  s.elementAt(0).then((value){
    Expect.equals(VAL, value);
    asyncEnd();
  });
}

main() {
  check(IsolateStream.fromIterable([VAL,2,3]));
  check(IsolateStream.fromIterable(new Iterable.generate(1, (int index)=>VAL)));
}
