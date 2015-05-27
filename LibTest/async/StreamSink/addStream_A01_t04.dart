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
 * @description Checks that addStream() can not be followed by add(),
 * addError() or close() while the future is not completed.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";


main() {
  var from = new Stream.fromIterable([5,6]);

  var c = new StreamController();
  var sink = c.sink;

  sink.addStream(from).then((_) {
    c.close();
  });

  Expect.throws(() => sink.add(1));
  Expect.throws(() => sink.addError(2));
  Expect.throws(() => sink.close());
}
