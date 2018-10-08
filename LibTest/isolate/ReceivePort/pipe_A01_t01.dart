/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 * Binds this stream as the input of the provided StreamConsumer. 
 * @description Checks that this stream is piped through streamConsumer
 * @author ilya
 * @node future completion value is not documented
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

main() {
  var values = [];
  var c = new StreamController();

  c.stream.listen((x) {
    values.add(x);
  });

  var s = IsolateStream.fromIterable([1,2,3]);

  asyncStart();
  s.pipe(c.sink).then((x) {
    Expect.listEquals([1,2,3], values);
    asyncEnd();
  });
}
