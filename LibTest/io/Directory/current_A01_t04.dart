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
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void entryPoint(SendPort sendPort) {
  sendPort.send(Directory.current.path);
}

main() {
  Directory dir = getTempDirectorySync();
  String newPath = dir.path;
  String oldPath = Directory.current.path;

  Directory.current = newPath;
  asyncStart();

  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
      (data){
    try {
      Expect.equals(newPath, data);
      Expect.isTrue(Directory.current is Directory);
      Expect.equals(newPath, Directory.current.path);
      asyncEnd();
      receivePort.close();
    } finally {
      Directory.current = oldPath;
      dir.delete(recursive: true);
    }
  }
  );
  Isolate.spawn(entryPoint, receivePort.sendPort);
}
