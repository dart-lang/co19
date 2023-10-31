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
/// @description Checks that if `exclusive` is `false`, existing files are left
/// untouched by create. Test [Link] pointing to a file
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_test(Directory sandbox, {bool recursive = false}) async {
  File target = getTempFileSync(parent: sandbox);
  target.writeAsStringSync("Target content");
  Link link = getTempLinkSync(parent: sandbox, target: target.path);
  File file = File(link.path);
  await file.create(recursive: recursive).then((File created) {
    Expect.isTrue(created.existsSync());
    Expect.equals(file.path, created.path);
    // Now check that all read/write operations are performed on link's target
    Expect.equals("Target content", file.readAsStringSync());
    created.writeAsStringSync("Lily was here");
    Expect.equals("Lily was here", target.readAsStringSync());
    // Delete doesn't delete target of the link
    created.deleteSync();
    Expect.isFalse(file.existsSync());
    Expect.isTrue(target.existsSync());
    asyncEnd();
  });
}

_main(Directory sandbox) async {
  asyncMultiStart(2);
  await _test(sandbox, recursive: false);
  await _test(sandbox, recursive: true);
}
