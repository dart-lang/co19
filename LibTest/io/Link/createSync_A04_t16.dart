// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void createSync(
///   String target,
///   {bool recursive = false}
/// )
///  Synchronously create the link. Calling createSync on an existing link will
///  throw an exception.
///
/// If recursive is false, the default, the link is created only if all
/// directories in its path exist. If recursive is true, all non-existing parent
/// paths are created first. The directories in the path of target are not
/// affected, unless they are also in path.
///
/// On the Windows platform, this call will create a true symbolic link instead
/// of a junction. The link represents a file or directory and does not change
/// its type after creation. If [target] exists then the type of the link will
/// match the type [target], otherwise a file symlink is created.
///
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled,
/// otherwise a [FileSystemException] will be raised with
/// `ERROR_PRIVILEGE_NOT_HELD` set as the errno when this call is made.
///
/// On other platforms, the POSIX symlink() call is used to make a symbolic link
/// containing the string target. If target is a relative path, it will be
/// interpreted relative to the directory containing the link.
///
/// @description Checks that if a link with the not existing target was created
/// and then a directory on the link's target was created, then the link become
/// invalid on Windows and changes its type on other platforms
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main);
}

_main(Directory sandbox) {
  String linkTarget = getTempFilePath(parent: sandbox);
  Link link = Link(getTempFilePath(parent: sandbox));
  link.createSync(linkTarget);
  if (Platform.isWindows) {
    Expect.equals(
        FileSystemEntityType.link, FileSystemEntity.typeSync(link.path));
  } else {
    Expect.equals(
        FileSystemEntityType.notFound, FileSystemEntity.typeSync(link.path));
  }
  Directory target2 = Directory(linkTarget);
  target2.createSync();
  if (Platform.isWindows) {
    Expect.equals(
        FileSystemEntityType.link, FileSystemEntity.typeSync(link.path));
  } else {
    Expect.equals(
        FileSystemEntityType.directory, FileSystemEntity.typeSync(link.path));
  }
  target2.deleteSync();

  Link target3 = Link(linkTarget);
  target3.createSync(sandbox.path);
  if (Platform.isWindows) {
    Expect.equals(
        FileSystemEntityType.link, FileSystemEntity.typeSync(link.path));
  } else {
    Expect.equals(
        FileSystemEntityType.directory, FileSystemEntity.typeSync(link.path));
  }
}
