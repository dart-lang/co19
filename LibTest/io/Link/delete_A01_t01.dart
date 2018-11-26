/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileSystemEntity> delete({
 *  bool recursive: false
 *  })
 * Deletes this FileSystemEntity.
 *
 * If the FileSystemEntity is a directory, and if recursive is false, the
 * directory must be empty. Otherwise, if recursive is true, the directory and
 * all sub-directories and files in the directories are deleted. Links are not
 * followed when deleting recursively. Only the link is deleted, not its target.
 *
 * If recursive is true, the FileSystemEntity is deleted even if the type of the
 * FileSystemEntity doesn't match the content of the file system. This behavior
 * allows delete to be used to unconditionally delete any file system object.
 *
 * Returns a Future<FileSystemEntity> that completes with this FileSystemEntity
 * when the deletion is done. If the FileSystemEntity cannot be deleted, the
 * future completes with an exception.
 * @description Checks that this method deletes this FileSystemEntity and
 * returns a Future<FileSystemEntity> that completes with this FileSystemEntity
 * when the deletion is done
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(target: target.path, parent: sandbox);
  asyncStart();
  await link.delete().then((deleted) {
    Expect.isFalse(link.existsSync());
    Expect.isFalse(deleted.existsSync());
    asyncEnd();
  });
}
