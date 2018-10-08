/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future done
 * Return a future which is completed when the StreamSink is finished.
 *
 * If the StreamSink fails with an error, perhaps in response to adding events
 * using add, addError or close, the done future will complete with that error.
 *
 * Otherwise, the returned future will complete when either:
 *  - all events have been processed and the sink has been closed, or
 *  - the sink has otherwise been stopped from handling more events (for
 *    example by cancelling a stream subscription).
 *
 * @description Checks that if synchronous methods resulted in an error,
 * while there was no active future, the done future completes with that error.
 * @author ilya
 * @needsreview what is considered an error?
 */

import "dart:async";

main() {
  var c = new StreamController();

  c.done
    .then((x) {
      print('completed with value $x');
    })
    .catchError((x) {
      print('completed with error $x');
    });

  c.addError(1);

  c.stream.listen(null, onError: (_) {});
  //c.stream.listen(null);

  c.close()
    .then((x) {
      print('completed with value $x');
    })
    .catchError((x) {
      print('completed with error $x');
    });
}
