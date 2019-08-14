/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream transform(StreamTransformer<T, dynamic> streamTransformer)
 * Chains this stream as the input of the provided StreamTransformer.
 * Returns the result of streamTransformer.bind itself.
 * @description Checks that data events are produced according to transform.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

var input = [1, 2, 3, 4, 5];
var expected = [1, 2, 3, 6, 5, 10];

// transform: skip evens, produce number and its double
StreamTransformer createMyTransformer() {
  return new StreamTransformer.fromHandlers(
      handleData: (event, EventSink sink) {
    if (event.isOdd) {
      sink.add(event);
      sink.add(event * 2);
    }
  });
}

main() {
  var s = IsolateStream.fromIterable(input).transform(createMyTransformer());
  var actual = [];

  asyncStart();

  s.listen((x) {
    actual.add(x);
  }, onDone: () {
    Expect.listEquals(expected, actual);
    asyncEnd();
  });
}
