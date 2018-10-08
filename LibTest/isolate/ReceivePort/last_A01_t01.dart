/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> last
 * Returns the last element of the stream.
 * @description Checks that the last element is returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

const VAL=123;

void check(Stream s) {
  asyncStart();
  s.last.then((value){
    Expect.equals(VAL, value);
    asyncEnd();
  });
}

main() {
  check(IsolateStream.fromIterable([VAL]));
  check(IsolateStream.fromIterable([VAL/2, VAL]));
  check(IsolateStream.fromIterable(new Iterable.generate(1, (int index)=>VAL)));
  check(IsolateStream.fromIterable(new Iterable.generate(2, (int index)=>VAL*index)));
}

