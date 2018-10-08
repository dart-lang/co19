/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeErrorListener(
 *                    SendPort port
 *                 )
 *    Stop listening for uncaught errors through port.
 *    The port should be a port that is listening for errors through
 * addErrorListener. This call requests that the isolate stops sending errors
 * on the port.
 *
 * @description Check that given port do not receive isolate errors after call
 * to removeErrorListener().
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort errorPort = new ReceivePort();
  StreamIterator errors = new StreamIterator(errorPort);
  ErrorServer server = await ErrorServer.spawn(
    onError:errorPort.sendPort,
    errorsAreFatal:false
  );
  for (int i=0; i<3; i++) {
    server.generateError();
    Expect.isTrue(await errors.moveNext());
    Expect.equals(i.toString(), errors.current[0]);
  }

  server.isolate.removeErrorListener(errorPort.sendPort);

  server.generateError(); // these errors should not be received
  server.generateError();

  // check for unexpected events
  Expect.isFalse(await errors.moveNext().timeout(ONE_SECOND, onTimeout:()=>false));

  server.requestStop();
  errorPort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
