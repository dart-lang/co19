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
 *    Asks the isolate to send response on responsePort when it terminates.
 *    The isolate will send a response message on responsePort as the last
 * thing before it terminates. It will run no further code after the message
 * has been sent.
 *
 * @description Check that isolate sends event on responsePort,
 * when it terminates. Parameter response is not specified.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);
  ReceivePort onExit = new ReceivePort();
  onExit.listen(
    (_) {
      onExit.close();
      asyncEnd();
    }
  );
  server.isolate.addOnExitListener(onExit.sendPort);
  server.requestStop();
}

main() {
  asyncStart();
  test();
}
