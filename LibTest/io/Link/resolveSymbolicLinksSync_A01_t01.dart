// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String resolveSymbolicLinksSync()
/// Resolves the path of a file system object relative to the current working
/// directory, resolving all symbolic links on the path and resolving all .. and
/// . path segments.
///
/// resolveSymbolicLinksSync uses the operating system's native file system API
/// to resolve the path, using the realpath function on linux and OS X, and the
/// GetFinalPathNameByHandle function on Windows. If the path does not point to
/// an existing file system object, resolveSymbolicLinksSync throws a
/// FileSystemException.
///
/// On Windows the .. segments are resolved before resolving the symbolic link,
/// and on other platforms the symbolic links are resolved to their target
/// before applying a .. that follows.
///
/// @description Check that this method resolves the path of a file system object
/// relative to the current working directory, resolving all symbolic links on
/// the path and resolving all .. and . path segments
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @Issue 29096, 45981
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:math";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  // create 2 Directories
  Directory dir1 = getTempDirectorySync(parent: sandbox);
  Directory dir2 = getTempDirectorySync(parent: sandbox);
  String dir2Name = getEntityName(dir2);

  var rnd = new Random(new DateTime.now().microsecondsSinceEpoch);
  // create link to the directory dir1
  Link link1 = getTempLinkSync(
      parent: sandbox,
      target: dir1.path,
      name: "resolveSymbolicLinksSync_A01_t01_1_" +
          rnd.nextInt(10000).toString() +
          ".lnk");
  // in dir1 create link to dir1
  Link link2 = getTempLinkSync(
      parent: dir1,
      target: ".",
      name: "resolveSymbolicLinksSync_A01_t01_2_" +
          rnd.nextInt(10000).toString() +
          ".lnk");
  // in dir1 create link to dir2
  Link link3 = getTempLinkSync(
      parent: dir1,
      target: ".." + Platform.pathSeparator + dir2Name,
      name: "resolveSymbolicLinksSync_A01_t01_3_" +
          rnd.nextInt(10000).toString() +
          ".lnk");

  Expect.equals(dir1.path, link1.resolveSymbolicLinksSync());
  Expect.equals(dir1.path, link2.resolveSymbolicLinksSync());
  Expect.equals(dir2.path, link3.resolveSymbolicLinksSync());
}
