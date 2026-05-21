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
/// to-be-created exists, and this link points to a file, then an exception is
/// thrown.
/// @author sgrekhov22@gmail.com

import 'dart:io';
import '../../../Utils/expect.dart';
import '../file_utils.dart';

main() async {
  await inSandbox(_main);
}

void _test(Directory sandbox, {required bool recursive}) {
  File target = createTempFileSync(parent: sandbox);
  Link link = createTempLinkSync(parent: sandbox, target: target.path);
  Directory dir = Directory(link.path);
  Expect.throws(() {
    dir.createSync(recursive: recursive);
  });
}

void _main(Directory sandbox) {
  _test(sandbox, recursive: true);
  _test(sandbox, recursive: false);
}
