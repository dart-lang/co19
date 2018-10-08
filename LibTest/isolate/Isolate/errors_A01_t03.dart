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
 * @description check that several subscriptions to the errors stream is
 * possible.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  // setup
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);
  List received1 = [];
  StreamSubscription ss1 = server.isolate.errors.listen(
    (data) { received1.add(data); },
    onError: (e) { received1.add(e); }
  );
  List received2 = [];
  StreamSubscription ss2 = server.isolate.errors.listen(
    (data) { received2.add(data); },
    onError: (e) { received2.add(e); }
  );
  // produce errors
  for (int i=0; i<3; i++) {
    server.generateError();
  }
  // clean up
  await server.stop();
  ss1.cancel();
  ss2.cancel();
  // check results
  Expect.equals(3, received1.length);
  Expect.equals(3, received2.length);
  for (int i=0; i<received1.length; i++){
    Expect.equals(received1[i].toString(), received2[i].toString());
  }
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
