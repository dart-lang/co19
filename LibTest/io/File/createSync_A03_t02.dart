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
/// @description Checks that if `exclusive` is `true` and to-be-created file
/// already exists, then a [PathExistsException] is thrown.
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main);
}

_test(Directory sandbox, {bool recursive = false}) async {
  File tmp = getTempFileSync(parent: sandbox);
  File file = new File(tmp.path);
  Expect.throws(() {
    file.createSync(exclusive: true, recursive: recursive);
  }, (e) => e is PathExistsException);
}

_main(Directory sandbox) {
  _test(sandbox, recursive: false);
  _test(sandbox, recursive: true);
}
