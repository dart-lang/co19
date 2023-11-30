// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<String> resolveSymbolicLinks()
/// Resolves the path of a file system object relative to the current working
/// directory, resolving all symbolic links on the path and resolving
/// all .. and . path segments.
///
/// resolveSymbolicLinks uses the operating system's native file system API to
/// resolve the path, using the realpath function on linux and OS X, and the
/// GetFinalPathNameByHandle function on Windows. If the path does not point to
/// an existing file system object, resolveSymbolicLinks throws a
/// FileSystemException.
///
/// On Windows the .. segments are resolved before resolving the symbolic link,
/// and on other platforms the symbolic links are resolved to their target
/// before applying a .. that follows.
///
/// @description Check that a FileSystemException is thrown if the path does not
/// point to an existing file system object.
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Link link1 = getTempLinkSync(target: target.path, parent: sandbox);

  asyncStart();
  await link1.resolveSymbolicLinks().then((_) {
    target.deleteSync();
    link1.resolveSymbolicLinks().then((String path) {
      Expect.fail("FileSystemException expected");
    }, onError: (e) {
      Expect.isTrue(e is FileSystemException);
      asyncEnd();
    });
  });
}
