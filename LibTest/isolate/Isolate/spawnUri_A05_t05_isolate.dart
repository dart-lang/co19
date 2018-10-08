/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the errorAreFatal, onExit and/or onError parameters are
 * provided, the isolate will act as if, respectively, setErrorsFatal,
 * addOnExitListener and addErrorListener were called with the corresponding
 * parameter and was processed before the isolate starts running.
 *
 * @description Check that with errorAreFatal set to false the isolate is
 * only suspended on any error. The isolate is passive.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";

main(List<String> args, List message) {
  SendPort sendPort = message[1];
  ReceivePort receivePort = new ReceivePort();
  dynamic i = 1;

  receivePort.listen(
     (data) {
        sendPort.send(data);
        // An error that should suspend the isolate
        sendPort.send(", " + i);
        sendPort.send("hello");
     }
  );
  message[0].send(receivePort.sendPort);
}
