/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future addStream(Stream<S> stream)
 * @description Checks that if stream contains only data events, they are
 * all added to a sink.
 * @author ilya
 * @issue 14332
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
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
