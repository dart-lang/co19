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
 * null value on given send port. The isolate is terminated with error.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

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

  Isolate.spawnUri(
      new Uri.file("spawnUri_A06_t03_isolate.dart"),
      null, // args
      null, // message
      errorsAreFatal:true,
      onExit:exitPort.sendPort
  );
}
