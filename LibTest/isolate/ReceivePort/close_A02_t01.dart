/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void close()
 * If the stream has already been canceled this method has no effect.
 * @description Checks multiple invocation of [close].
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */

import 'dart:async';
import "dart:isolate";
import "../../../Utils/expect.dart";

void iMain(SendPort replyPort) {
  replyPort.send("message");
}

main() {
  asyncStart();
  ReceivePort receivePort = new ReceivePort();
  var sendPort = receivePort.sendPort;
  Future.wait([Isolate.spawn(iMain, sendPort), receivePort.first]).then(
      (v) => receivePort.close()
  ).then(
      (v) => receivePort.close()
  ).then(
      (v) => receivePort.close()
  ).then(
      (v) => asyncEnd()
  );
}