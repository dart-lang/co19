/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void deleteSync({bool recursive: false})
 * Synchronously deletes this FileSystemEntity.
 *
 * If the FileSystemEntity is a directory, and if recursive is false, the
 * directory must be empty. Otherwise, if recursive is true, the directory and
 * all sub-directories and files in the directories are deleted. Links are not
 * followed when deleting recursively. Only the link is deleted, not its target.
 *
 * If recursive is true, the FileSystemEntity is deleted even if the type of the
 * FileSystemEntity doesn't match the content of the file system. This behavior
 * allows deleteSync to be used to unconditionally delete any file system object.
 *
 * Throws an exception if the FileSystemEntity cannot be deleted.
 * @description Checks that if recursive is true, the FileSystemEntity is
 * deleted even if the type of the FileSystemEntity doesn't match the content of
 * the file system. Test Link
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
  Directory dir = new Directory(link.path);
  dir.deleteSync(recursive: true);
  Expect.isFalse(link.existsSync());
}
