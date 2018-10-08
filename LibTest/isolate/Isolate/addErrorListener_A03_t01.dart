/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addErrorListener(
 *                      SendPort port
 *            )
 * Requests that uncaught errors of the isolate are sent back to port.
 *
 * @description Check that several listeners can be added and all listeners
 * receive same errors
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);

  List<ReceivePort> errorPorts = [];
  List<StreamIterator> errorIterator = [];
  for (int i=0; i<3; i++){
    ReceivePort ep = new ReceivePort();
    errorPorts.add(ep);
    server.isolate.addErrorListener(ep.sendPort);
    errorIterator.add(new StreamIterator(ep));
  }

  for (int i=0; i<5; i++){
    server.generateError();
    for (StreamIterator ei in errorIterator) {
      await ei.moveNext();
      Expect.isTrue(ei.current is List);
      List error = ei.current;
      Expect.equals(2, error.length);
      Expect.isTrue(error[0] is String);
      Expect.isTrue(error[1] is String);
      Expect.equals(i.toString(), error[0]);
    }
  }
  server.requestStop();
  // check for unexpected events
  List<Future<bool>> unexpectedEvents = [];
  for (StreamIterator ei in errorIterator) {
    unexpectedEvents.add(ei.moveNext().timeout(TWO_SECONDS, onTimeout:() => false));
  }
  Expect.listEquals([false,false,false], await Future.wait(unexpectedEvents));
  errorPorts.forEach((ReceivePort ei) => ei.close());
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
