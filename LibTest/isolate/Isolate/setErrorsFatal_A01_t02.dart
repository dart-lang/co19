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
 * @description Check that after call to setErrorsFatal(false) uncaught error
 * will not terminate the isolate.
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
  StreamIterator errors = new StreamIterator(errorPort);
  ErrorServer server = await ErrorServer.spawn(
                                                errorsAreFatal:true,
                                                onError: errorPort.sendPort
                                             );
  server.isolate.setErrorsFatal(false);
  // verify that errors are not fatal
  for (int i=0; i<3; i++) {
    server.generateError();
    Expect.isTrue(await errors.moveNext());
    Expect.equals(i.toString(), errors.current[0]);
  }
  // clean up
  await server.stop();
  errorPort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
