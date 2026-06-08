// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion type static method
/// ```
/// Future<FileSystemEntityType> type(
///   String path,
///   {bool followLinks = true}
/// )
/// ```
/// Finds the type of file system object that a path points to.
///
/// Returns a [Future<FileSystemEntityType>] that completes with the same
/// results as [typeSync].
///
/// @description Checks that this method returns [FileSystemEntityType.file] if
/// `path` points to a link, the target is a file and `followLinks` is `true` .
/// @author sgrekhov22@gmail.com

import 'dart:io';
import '../../../Utils/expect.dart';
import '../file_utils.dart';

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  final file = createTempFileSync(parent: sandbox);
  final link = createTempLinkSync(parent: sandbox, target: file.path);
  Expect.equals(
    FileSystemEntityType.file,
    await FileSystemEntity.type(link.path),
  );
}
