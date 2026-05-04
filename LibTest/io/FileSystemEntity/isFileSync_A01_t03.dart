// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isFileSync(String path)
/// Synchronously checks if `typeSync(path)` returns [FileSystemEntityType.file]
///
/// @description Checks that this property synchronously checks if
/// `typeSync(path)` returns [FileSystemEntityType.file]. Test a [Link].
/// @issue 24821, 30410
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  final dirLink = getTempLinkSync(parent: sandbox);
  Expect.isFalse(FileSystemEntity.isFileSync(dirLink.path));
  Expect.equals(FileSystemEntityType.directory,
      FileSystemEntity.typeSync(dirLink.path));

  final target = getTempFileSync(parent: sandbox);
  final fileLink = getTempLinkSync(parent: sandbox, target: target.path);
  Expect.isTrue(FileSystemEntity.isFileSync(fileLink.path));
  Expect.equals(FileSystemEntityType.file,
      FileSystemEntity.typeSync(fileLink.path));

  final notExisting = getTempFilePath(parent: sandbox);
  final brokenLink = getTempLinkSync(parent: sandbox, target: notExisting);
  Expect.isFalse(FileSystemEntity.isFileSync(brokenLink.path));
  Expect.equals(FileSystemEntityType.notFound,
      FileSystemEntity.typeSync(brokenLink.path));
}
