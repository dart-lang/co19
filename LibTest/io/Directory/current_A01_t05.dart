/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory current
 * Creates a directory object pointing to the current working directory.
 * @description Checks that setting the current working directory is a
 * synchronous operation and that it changes the working directory of all
 * isolates.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

Directory dir;
String newPath;
String oldPath;

void entryPoint(SendPort sendPort) {
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((_) => sendPort.send(Directory.current.path));
  sendPort.send(receivePort.sendPort);
}

test() async {
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((data) {
    if (data is SendPort) {
      Directory.current = newPath;
      (data as SendPort).send("");
    } else {
      try {
        Expect.equals(newPath, data);
      } finally {
        Directory.current = oldPath;
        dir.delete(recursive: true);
        asyncEnd();
      }
    }
  });
  await Isolate.spawn(entryPoint, receivePort.sendPort);
}

main() {
  dir = getTempDirectorySync();
  oldPath = Directory.current.path;
  newPath = dir.path;
  asyncStart();
  test();
}
