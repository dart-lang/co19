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
 * @description Check that if onExit parameter is supplied, the isolate sends
 * null value via given send port. The isolate does nothing.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

void entryPoint(message) {}

main() {
  asyncStart();
  ReceivePort exitPort = new ReceivePort();
  exitPort.listen(
     (value) {
        exitPort.close();
        Expect.isNull(value);
        asyncEnd();
     }
  );

  Isolate.spawn(entryPoint, "hello", onExit:exitPort.sendPort);
}
