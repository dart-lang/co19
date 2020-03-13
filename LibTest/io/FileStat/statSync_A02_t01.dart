/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion FileStat statSync(String path)
 * Calls the operating system's stat() function on path. Returns a FileStat
 * object containing the data returned by stat(). If the call fails, returns a
 * FileStat object with .type set to FileSystemEntityType.notFound and the
 * other fields invalid.
 * @description Checks that if the call fails, returns a FileStat object with
 * .type set to FileSystemEntityType.notFound and the other fields invalid.
 * @author sgrekhov@unipro.ru
 * @issue 40706
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  DateTime begOfEpoch = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  File file = new File(getTempFilePath(parent: sandbox));
  FileStat fs = FileStat.statSync(file.path);
  Expect.equals(FileSystemEntityType.notFound, fs.type);
  Expect.equals(-1, fs.size);
  Expect.equals(0, fs.mode);
  Expect.isTrue(begOfEpoch.isAtSameMomentAs(fs.accessed));
  Expect.isTrue(begOfEpoch.isAtSameMomentAs(fs.changed));
  Expect.isTrue(begOfEpoch.isAtSameMomentAs(fs.modified));
}
