/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future addStream(Stream<S> stream)
 * @description Checks that data events from stream are added correctly.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();
  var iter = [1,2,3];
  var s = new Stream.fromIterable(iter);

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals(iter, x);
    asyncEnd();
  });
  
  asyncStart();
  c.addStream(s).then((_) {
    c.close();
    asyncEnd();
  });
}
