// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void deleteSync({bool recursive: false})
/// Synchronously deletes this FileSystemEntity.
///
/// If the FileSystemEntity is a directory, and if recursive is false, the
/// directory must be empty. Otherwise, if recursive is true, the directory and
/// all sub-directories and files in the directories are deleted. Links are not
/// followed when deleting recursively. Only the link is deleted, not its target.
///
/// If recursive is true, the FileSystemEntity is deleted even if the type of the
/// FileSystemEntity doesn't match the content of the file system. This behavior
/// allows deleteSync to be used to unconditionally delete any file system object.
///
/// Throws an exception if the FileSystemEntity cannot be deleted.
/// @description Checks that this method synchronously deletes this
/// FileSystemEntity
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(target: target.path, parent: sandbox);
  link.deleteSync();
  Expect.isFalse(link.existsSync());
}
