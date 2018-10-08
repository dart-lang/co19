/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream errors
 *   Returns a broadcast stream of uncaught errors from the isolate.
 *   Each error is provided as an error event on the stream.
 *   The actual error object and stackTraces will not necessarily be the same
 * object types as in the actual isolate, but they will always have the same
 * Object.toString result.
 *   This stream is based on addErrorListener and removeErrorListener.
 *
 * @description Check that each error in isolate is provided as an error event
 * on the errors stream
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  // setup
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);
  List receivedErrors = [];
  StreamSubscription ss1 = server.isolate.errors.listen(
    (data) { receivedErrors.add(data); },
    onError: (e) { receivedErrors.add(e); }
  );
  // produce errors
  for (int i=0; i<3; i++) {
    server.generateError();
  }
  // clean up
  await server.stop();
  ss1.cancel();
  // check results
  Expect.equals(3, receivedErrors.length);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
