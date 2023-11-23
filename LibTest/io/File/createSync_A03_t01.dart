// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if `exclusive` is `false` then existing files are
/// left untouched by createSync
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main);
}

_test(Directory sandbox, {bool recursive = false}) async {
  File tmp = getTempFileSync(parent: sandbox);
  tmp.writeAsStringSync("Existing file content");
  File file = new File(tmp.path);

  file.createSync(recursive: recursive);
  Expect.isTrue(file.existsSync());
  Expect.equals(tmp.path, file.path);
  Expect.equals("Existing file content", file.readAsStringSync());
}

_main(Directory sandbox) {
  _test(sandbox, recursive: false);
  _test(sandbox, recursive: true);
}
