// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void createSync(
///   {bool recursive = false,
///   bool exclusive = false}
/// )
/// Synchronously creates the file.
///
/// If recursive is false, the default, the file is created only if all
/// directories in its path already exist. If recursive is true, all
/// non-existing parent paths are created first.
///
/// If exclusive is true and to-be-created file already exists, a
/// PathExistsException is thrown.
///
/// If exclusive is false, existing files are left untouched by createSync.
/// Calling createSync on an existing file still might fail if there are
/// restrictive permissions on the file.
///
/// Throws a FileSystemException if the operation fails.
///
/// @description Checks that a [FileSystemException] is thrown if the operation
/// fails. Test the case when there is an existing link to a directory on the
/// path
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_test(Directory sandbox, {bool recursive = false, bool exclusive = false}) {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(parent: sandbox, target: target.path);
  File file = new File(link.path);
  Expect.throws(() {
    file.createSync();
  },
      (e) => e is FileSystemException,
      "FileSystemException expected. "
      "Resursive=$recursive, exclusive=$exclusive");
}

void _main(Directory sandbox) {
  _test(sandbox, recursive: false, exclusive: false);
  _test(sandbox, recursive: false, exclusive: true);
  _test(sandbox, recursive: true, exclusive: false);
  _test(sandbox, recursive: true, exclusive: true);
}
