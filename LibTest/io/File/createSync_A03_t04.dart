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
/// @description Checks that if `exclusive` is `false`, existing files are left
/// untouched by create. Test [Link] pointing to a not existing entity
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_test(Directory sandbox, {bool recursive = false}) {
  File target = File(getTempFilePath(parent: sandbox));
  Expect.isFalse(target.existsSync());
  Link link = getTempLinkSync(parent: sandbox, target: target.path);
  File file = File(link.path);
  file.createSync(recursive: recursive);
  Expect.isTrue(file.existsSync());
  Expect.isTrue(target.existsSync());
  Expect.equals(file.path, link.path);
  // Now check that all read/write operations are performed on link's target
  file.writeAsStringSync("Lily was here");
  Expect.equals("Lily was here", target.readAsStringSync());
  // Delete doesn't delete the target of the link but the link itself
  file.deleteSync();
  Expect.isFalse(file.existsSync());
  Expect.isTrue(target.existsSync());
  Expect.isFalse(link.existsSync());
}

void _main(Directory sandbox) {
  _test(sandbox, recursive: false);
  _test(sandbox, recursive: true);
}
