/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Stream<T> bind(Stream<S> stream)
 * @description Checks that transformer.bind(stream) is equivalent to
 * stream.transform(transformer)
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stream s = new Stream.fromIterable([1,2,3,4,5]);
  
  // odd numbers as data events, even numbers as error events
  s = s.map((x) => x.isOdd ? x : throw x);

  StreamTransformer tr = new StreamTransformer.fromHandlers(
      handleData:(x, sink) { sink.add(x); },
      handleError: (x, st, sink) { sink.add(x); },
      handleDone: (sink) { sink.add(6); sink.add(7); sink.close(); }
  );
  
  asyncStart();
  tr.bind(s).toList().then(
    (x) {
      Expect.listEquals([1,2,3,4,5,6,7], x);
      asyncEnd();
    }
  );
}
