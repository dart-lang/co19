// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion typeSync static method
/// ```
/// FileSystemEntityType typeSync(
///   String path, {
///   bool followLinks = true,
/// })
/// ```
/// Synchronously finds the type of file system object that a path points to.
///
/// Returns [FileSystemEntityType.notFound] if `path` does not point to a file
/// system object or if any other error occurs in looking up the path.
///
/// If `path` points to a link and `followLinks` is `true` then the result will
/// be for the file system object that the link points to. If that object does
/// not exist then the result will be [FileSystemEntityType.notFound]. If path
/// points to a link and `followLinks` is false then the result will be
/// [FileSystemEntityType.link].
///
/// @description Checks that this method returns [FileSystemEntityType.file] if
/// `path` points to a file.
/// @author sgrekhov22@gmail.com

import 'dart:io';
import '../../../Utils/expect.dart';
import '../file_utils.dart';

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  final file = createTempFileSync(parent: sandbox);
  Expect.equals(
    FileSystemEntityType.file,
    FileSystemEntity.typeSync(file.path),
  );
}
