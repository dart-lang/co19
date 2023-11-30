// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<Link> create(
///  String target, {
///  bool recursive: false
///  })
/// Creates a symbolic link in the file system.
///
/// The created link will point to the path at `target`, whether that path
/// exists or not.
///
/// Returns a `Future<Link>` that completes with the link when it has been
/// created. If the link path already exists, the future will complete with an
/// error.
///
/// If `recursive` is `false`, the default, the link is created only if all
/// directories in its path exist. If `recursive` is `true`, all non-existing
/// parent paths are created first. The directories in the path of target are
/// not affected, unless they are also in [path].
///
/// On the Windows platform, this call will create a true symbolic link instead
/// of a junction. The link represents a file or directory and does not change
/// its type after creation. If `target` exists then the type of the link will
/// match the type `target`, otherwise a file symlink is created.
///
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a [FileSystemException] will be raised with `ERROR_PRIVILEGE_NOT_HELD` set
/// as the errno when this call is made.
///
/// On other platforms, the POSIX `symlink()` call is used to make a symbolic
/// link containing the string `target`. If `target` is a relative path, it will
/// be interpreted relative to the directory containing the link.
///
/// @description Checks that relative paths to the target will be interpreted
/// relative to the directory containing the link. Test relative path to [Link]
/// pointing to a not existing entity
/// @author sgrekhov22@gmail.com
/// @issue 53684

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  String notExisting = getTempFileName();
  String target = getTempFileName(extension: "lnk");
  Link targetLink =
      getTempLinkSync(parent: sandbox, target: notExisting, name: target);
  Link link = Link(sandbox.path +
      Platform.pathSeparator +
      getTempFileName(extension: "lnk"));
  asyncStart();
  await link.create(target).then((Link created) {
    Expect.equals(target, created.targetSync());
    Expect.equals(FileSystemEntityType.notFound,
        FileSystemEntity.typeSync(created.path));
    // Now create a directory and into it another directory with the name as
    // link's target. Then move the link into the first directory. Its relative
    // target should point to the second directory after it (except Windows)
    Directory dir1 = getTempDirectorySync(parent: sandbox);
    Directory dir2 = Directory(dir1.path + Platform.pathSeparator + target);
    dir2.createSync();
    Link moved =
        created.renameSync(dir1.path + Platform.pathSeparator + "moved.lnk");
    Expect.equals(target, moved.targetSync());
    if (Platform.isWindows) {
      Expect.equals(
          FileSystemEntityType.notFound, FileSystemEntity.typeSync(moved.path));
    } else {
      Expect.equals(FileSystemEntityType.directory,
          FileSystemEntity.typeSync(moved.path));
    }
    asyncEnd();
  });
}
