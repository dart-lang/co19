/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setErrorsFatal(
 *                                bool errorsAreFatal
 *                               )
 * ...
 *    This call requires the terminateCapability for the isolate. If the
 * capability is not correct, no change is made.
 *
 * @description Check that call to setErrorsFatal(true) on isolate without
 * terminateCapability have no effect
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

Future test(Capability wrongCapability) async {
  // setup
  ReceivePort errorPort = new ReceivePort();
  StreamIterator errors = new StreamIterator(errorPort);
  ErrorServer server = await ErrorServer.spawn(
                                                errorsAreFatal:false,
                                                onError: errorPort.sendPort
                                             );
  Isolate isolate = new Isolate(
      server.isolate.controlPort,
      pauseCapability:null,
      terminateCapability:wrongCapability
  );

  isolate.setErrorsFatal(true);

  // verify that errors are still not fatal
  for (int i=0; i<3; i++) {
    server.generateError();
    Expect.isTrue(await errors.moveNext());
    Expect.equals(i.toString(), errors.current[0]);
  }

  // clean up
  await server.stop();
  errorPort.close();
}

main() {
  asyncStart();
  Future.wait(
      [test(null), test(new Capability())]
  ).then(
      (_) => asyncEnd()
  );
}
