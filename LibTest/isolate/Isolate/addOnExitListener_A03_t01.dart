/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addOnExitListener(
 *                    SendPort responsePort, {
 *                    Object response
 *            })
 * ...
 *   If the isolate is already dead, no message will be sent.
 *
 * @description Check that dead isolate does not send events on responsePort.
 * Parameter response is not specified.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);
  ReceivePort onExit = new ReceivePort();
  int eventsCount = 0;
  onExit.listen(
    (_) {
      eventsCount++;
    }
  );
  await server.stop();
  server.isolate.addOnExitListener(onExit.sendPort);
  await new Future.delayed(TWO_SECONDS);
  onExit.close();
  Expect.equals(0, eventsCount);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
