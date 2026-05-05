// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<bool> isDirectory(String path)
/// Checks if `type(path)` returns [FileSystemEntityType.directory].
///
/// @description Checks that this property returns `true` if `type(path)`
/// returns [FileSystemEntityType.directory] and false otherwise. Test a [Link].
/// @author sgrekhov@unipro.ru
/// @issue 24821, 30410

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  // dirLink will be a link to a temp directory in the sandbox because no target
  // is passed
  final dirLink = getTempLinkSync(parent: sandbox);
  Expect.isTrue(await FileSystemEntity.isDirectory(dirLink.path));
  final type1 = await FileSystemEntity.type(dirLink.path);
  Expect.equals(FileSystemEntityType.directory, type1);

  final target = getTempFileSync(parent: sandbox);
  final fileLink = getTempLinkSync(parent: sandbox, target: target.path);
  Expect.isFalse(await FileSystemEntity.isDirectory(fileLink.path));
  final type2 = await FileSystemEntity.type(fileLink.path);
  Expect.equals(FileSystemEntityType.file, type2);

  // notExisting will be a path to a non-existing file in the sandbox
  final notExisting = getTempFilePath(parent: sandbox);
  final brokenLink = getTempLinkSync(parent: sandbox, target: notExisting);
  Expect.isFalse(await FileSystemEntity.isDirectory(brokenLink.path));
  final type3 = await FileSystemEntity.type(brokenLink.path);
  Expect.equals(FileSystemEntityType.notFound, type3);
}
