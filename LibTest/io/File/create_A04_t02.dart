// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<File> create(
///   {bool recursive = false,
///   bool exclusive = false}
/// )
/// Creates the file.
///
/// Returns a Future<File> that completes with the file when it has been created
///
/// If recursive is false, the default, the file is created only if all
/// directories in its path already exist. If recursive is true, any
/// non-existing parent paths are created first.
///
/// If exclusive is true and to-be-created file already exists, this operation
/// completes the future with a PathExistsException.
///
/// If exclusive is false, existing files are left untouched by create. Calling
/// create on an existing file still might fail if there are restrictive
/// permissions on the file.
///
/// Completes the future with a FileSystemException if the operation fails.
///
/// @description Checks that future is completed with a `FileSystemException` if
/// the operation fails. Test the case when there is an existing link to a
/// directory on the path
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_test(Directory sandbox,
    {bool recursive = false, bool exclusive = false}) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link = getTempLinkSync(parent: sandbox, target: target.path);
  File file = File(link.path);
  await file.create(recursive: recursive, exclusive: exclusive).then(
      (File created) {
    Expect.fail("FileSystemException is expected."
        "Recursive=$recursive, exclusive=$exclusive");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}

void _main(Directory sandbox) async {
  asyncMultiStart(4);
  await _test(sandbox, recursive: false, exclusive: false);
  await _test(sandbox, recursive: false, exclusive: true);
  await _test(sandbox, recursive: true, exclusive: false);
  await _test(sandbox, recursive: true, exclusive: true);
}
