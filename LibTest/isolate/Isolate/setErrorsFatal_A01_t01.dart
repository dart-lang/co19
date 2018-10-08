/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setErrorsFatal(
 *                                bool errorsAreFatal
 *                               )
 *    Set whether uncaught errors will terminate the isolate.
 *    If errors are fatal, any uncaught error will terminate the isolate event
 * loop and shut down the isolate.
 *
 * @description Check that after call to setErrorsFatal(true) uncaught error
 * will terminate the isolate.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  // setup
  ReceivePort errorPort = new ReceivePort();
  ReceivePort exitPort = new ReceivePort();
  StreamIterator errors = new StreamIterator(errorPort);
  ErrorServer server = await ErrorServer.spawn(
                                                errorsAreFatal:false,
                                                onError: errorPort.sendPort,
                                                onExit: exitPort.sendPort
                                             );
  // verify that errors are not fatal
  server.generateError();
  Expect.isTrue(await errors.moveNext());
  Expect.equals("0", errors.current[0]);
  server.generateError();
  Expect.isTrue(await errors.moveNext());
  Expect.equals("1", errors.current[0]);

  server.isolate.setErrorsFatal(true);
  // verify that next error will terminate the isolate
  server.generateError();
  Expect.isTrue(await errors.moveNext());
  Expect.equals("2", errors.current[0]);
  await exitPort.first;
  // clean up
  errorPort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
