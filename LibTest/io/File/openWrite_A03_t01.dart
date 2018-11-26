/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink openWrite({
 * FileMode mode: FileMode.write,
 * Encoding encoding: utf8
 * })
 * Creates a new independent IOSink for the file. The IOSink must be closed when
 * no longer used, to free system resources.
 *
 * An IOSink for a file can be opened in two modes:
 *
 * FileMode.write: truncates the file to length zero.
 * FileMode.append: sets the initial write position to the end of the file.
 * When writing strings through the returned IOSink the encoding specified using
 * encoding will be used. The returned IOSink has an encoding property which can
 * be changed after the IOSink has been created.
 * @description Checks that if file path is wrong then this operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

test(Directory sandbox, FileMode mode) async {
  File file = getTempFileSync(parent: sandbox);
  file.writeAsStringSync("Lily was here");
  String path = "!" + file.absolute.path;
  File f = new File(path);
  IOSink sink = f.openWrite(mode: mode);

  await sink.close().then((_) {
    Expect.fail("Error expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
  });
}

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  await test(sandbox, FileMode.append);
  await test(sandbox, FileMode.write);
  await test(sandbox, FileMode.writeOnly);
  await test(sandbox, FileMode.writeOnlyAppend);
}
