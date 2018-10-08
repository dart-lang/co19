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
 * null value via given send port.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";

test() async {
  ReceivePort receivePort = new ReceivePort();
  Future<List> receivedData = receivePort.toList();
  ReceivePort exitPort = new ReceivePort();

  Isolate.spawnUri(
      new Uri.file("spawnUri_A06_t02_isolate.dart"),
      null, // args
      receivePort.sendPort,
      onExit:exitPort.sendPort
  );
  Expect.isNull(await exitPort.first);
  receivePort.close();
  Expect.listEquals(["hello", "world"], await receivedData);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
