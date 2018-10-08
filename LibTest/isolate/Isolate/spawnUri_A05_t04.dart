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
 * only suspended on any error. The isolate is active.
 * @issue #26652
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort receivePort = new ReceivePort();

  Isolate isolate = await Isolate.spawnUri(
                                new Uri.file("spawnUri_A05_t04_isolate.dart"),
                                null,
                                receivePort.sendPort,
                                errorsAreFatal:false);
  List receivedData = [];
  await for (var data in receivePort) {
    receivedData.add(data);
    Expect.equals("ping", await ping(isolate, "ping", THREE_SECONDS));
    if (data == "finish") {
      receivePort.close();
      Expect.listEquals(["hello","second","third","finish"], receivedData);
      asyncEnd();
    }
  }
}

main() {
  asyncStart();
  test();
}
