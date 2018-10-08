/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeOnExitListener(
 *                    SendPort responsePort
 *                 )
 *    Stop listening on exit messages from the isolate.
 *    If a call has previously been made to addOnExitListener with the same
 * send-port, this will unregister the port, and it will no longer receive
 * a message when the isolate terminates. A response may still be sent until
 * this operation is fully processed by the isolate.
 *
 * @description Check that given port does not receive events after call
 * to removeOnExitListener().
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort onExit = new ReceivePort();
  Future onExitFuture = onExit.first;
  ErrorServer server = await ErrorServer.spawn(
      errorsAreFatal:false,
      onExit:onExit.sendPort
  );

  server.isolate.removeOnExitListener(onExit.sendPort);

  await server.stop();
  onExitFuture = onExitFuture.timeout(
      new Duration(milliseconds:200),
      onTimeout:() => "timeout"
  );
  Expect.equals("timeout", await onExitFuture);
  onExit.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
