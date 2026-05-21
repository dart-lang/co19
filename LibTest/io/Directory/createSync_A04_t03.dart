// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ```
/// void createSync({bool recursive: false})
/// ```
/// Synchronously creates the directory if it doesn't exist.
///
/// If `recursive` is false, only the last directory in the path is created. If
/// `recursive` is true, all non-existing path components are created. If the
/// directory already exists nothing is done.
///
/// If the directory cannot be created an exception is thrown.
///
/// @description Checks that if a link with the name of the directory
/// to-be-created exists, and this link points to an existing directory, then
/// nothing is done.
/// @author sgrekhov22@gmail.com

import 'dart:io';
import '../../../Utils/expect.dart';
import '../file_utils.dart';

main() async {
  await inSandbox(_main);
}

void _test(Directory sandbox, {required bool recursive}) {
  Directory target = createTempDirectorySync(parent: sandbox);
  Link link = createTempLinkSync(parent: sandbox, target: target.path);
  Directory dir = Directory(link.path);
  dir.createSync(recursive: recursive);
  Expect.isTrue(dir.existsSync());
  Expect.notEquals(target.path, dir.path);
  // Check that that all operations with `dir` are operations with `target`
  Directory child = dir.createTempSync();
  // Check that `target` has a subdirectory `child`
  final childName = getEntityName(child);
  final children = target.listSync();
  Expect.equals(1, children.length);
  Expect.equals(childName, getEntityName(children[0]));
}

void _main(Directory sandbox) {
  _test(sandbox, recursive: true);
  _test(sandbox, recursive: false);
}
