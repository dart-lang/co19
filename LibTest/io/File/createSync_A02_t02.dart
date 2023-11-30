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
/// @description Checks that if recursive is true, all non-existing path
/// components are created
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  inSandbox(_main);
}

_test(Directory sandbox, {bool exclusive = false}) {
  String dirPath = getTempDirectoryPath(parent: sandbox);
  String filePath = dirPath + Platform.pathSeparator + getTempFileName();
  File file = new File(filePath);
  file.createSync(recursive: true, exclusive: exclusive);
  Expect.isTrue(file.existsSync());
  Expect.equals(filePath, file.path);
}

void _main(Directory sandbox) {
  _test(sandbox, exclusive: false);
  _test(sandbox, exclusive: true);
}
