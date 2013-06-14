/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(T match)
 * If this stream reports an error, the Future will report that error.
 * @description Checks that if this stream reports an error, the Future will report that error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Stream s=new Stream.fromFuture(completer.future);
  Error err=new Error();
  completer.completeError(err);
  asyncStart();
  s.listen((T event) {
      Expect.fail("unexpected call to onData()");
    },
    onError: (error) {
      Expect.equals(err, error);
    },
    onDone: () {
      asyncEnd();
    }
  );
}

