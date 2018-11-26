/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> readAsString({Encoding encoding: utf8})
 * Read the entire file contents as a string using the given Encoding.
 *
 * Returns a Future<String> that completes with the string once the file
 * contents has been read.
 * @description Checks that this method reads the entire file contents as lines
 * of text using the given Encoding. Test encoding argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Encoding encoding = Encoding.getByName("iso-8859-1");
  File file = getTempFileSync(parent: sandbox);

  IOSink sink = file.openWrite(encoding: encoding);
  sink.writeCharCode(0xe2);
  sink.writeCharCode(0xa);
  sink.writeCharCode(0xe3);
  asyncStart();
  await sink.close().then((_) async {
    await file.readAsString(encoding: encoding).then((data) {
      Expect.equals("â\nã", data);
      asyncEnd();
    });
  });
}
