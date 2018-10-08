/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void ping(
 *      SendPort responsePort, {
 *      Object response,
 *      int priority: IMMEDIATE
 * })
 *    Request that the isolate send response on the responsePort.
 * ...
 *    If response cannot be sent to the isolate, then the request is ignored.
 * It is recommended to only use simple values that can be sent to all isolates,
 * like null, booleans, numbers or strings.
 *
 * @description Check that if response cannot be sent to the isolate, then
 * the request is ignored.
 *
 * @issue #28094
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "dart:async";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn();
  // check
  ReceivePort pingPort = new ReceivePort();
  server.isolate.ping(pingPort.sendPort, response:server.isolate);
  Future pingResponse = pingPort.first.timeout(TWO_SECONDS, onTimeout: () {
    pingPort.close();
    return "timeout";
  });
  Expect.equals("timeout", await pingResponse);
  // clean up
  server.stop();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
