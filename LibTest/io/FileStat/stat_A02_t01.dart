/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileStat> stat(String path)
 * Asynchronously calls the operating system's stat() function on path. Returns
 * a Future which completes with a FileStat object containing the data returned
 * by stat(). If the call fails, completes the future with a FileStat object
 * with .type set to FileSystemEntityType.notFound and the other fields invalid.
 * @description Checks that if the call fails, completes the future with a
 * FileStat object with .type set to FileSystemEntityType.notFound and the
 * other fields invalid.
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
  asyncStart();
  await FileStat.stat(file.path).then((FileStat fs) {
    Expect.equals(FileSystemEntityType.notFound, fs.type);
    Expect.equals(-1, fs.size);
    Expect.equals(0, fs.mode);
    Expect.isTrue(begOfEpoch.isAtSameMomentAs(fs.accessed));
    Expect.isTrue(begOfEpoch.isAtSameMomentAs(fs.changed));
    Expect.isTrue(begOfEpoch.isAtSameMomentAs(fs.modified));
    asyncEnd();
  }, onError: (FileStat fs) {
    Expect.fail("Unexpected failure");
  });
}
