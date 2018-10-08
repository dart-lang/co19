/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future addStream(Stream<S> stream)
 * Consumes the elements of stream.
 * Listens on stream and does something for each event.
 * The consumer may stop listening after an error, or it may consume all the
 * errors and only stop at a done event.
 * @description Checks that if stream contains only data events, they are
 * all added to a sink.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var from = new Stream.fromIterable([1,2,3,4,5]);

  var c = new StreamController();
  var sink = c.sink;

  asyncStart();
  sink.addStream(from).then((_) {
    c.close();
    asyncEnd();
  });

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals([1,2,3,4,5], x);
    asyncEnd();
  });

}
