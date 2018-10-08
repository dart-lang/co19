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
 * @description Check that if onError parameter is supplied, the isolate
 * captures and send only first error on given send port, errorAreFatal is true.
 * The isolate is active.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort errorPort = new ReceivePort();
  Isolate.spawnUri(
      new Uri.file("spawnUri_A07_t05_isolate.dart"),
      null, // args
      null, // message
      errorsAreFatal:true,
      onError:errorPort.sendPort
  );

  int count = 0;
  await for (var error in errorPort) {

    Expect.equals(0, count, "received unexpected data $error");
    Expect.isTrue(error is List);
    Expect.equals(2, error.length);
    Expect.isTrue(error[0] is String);
    Expect.isTrue(error[1] is String);
    count++;
    new Future.delayed(THREE_SECONDS, () => errorPort.close());
  }
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
