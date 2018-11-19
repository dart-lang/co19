/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String resolveSymbolicLinksSync()
 * Resolves the path of a file system object relative to the current working
 * directory, resolving all symbolic links on the path and resolving all .. and
 * . path segments.
 *
 * resolveSymbolicLinksSync uses the operating system's native file system API
 * to resolve the path, using the realpath function on linux and OS X, and the
 * GetFinalPathNameByHandle function on Windows. If the path does not point to
 * an existing file system object, resolveSymbolicLinksSync throws a
 * FileSystemException.
 *
 * On Windows the .. segments are resolved before resolving the symbolic link,
 * and on other platforms the symbolic links are resolved to their target before
 * applying a .. that follows.
 * @description Check that this method resolves the path of a file system object
 * relative to the current working directory, resolving all symbolic links on
 * the path and resolving all .. and . path segments
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  // create 2 Directories
  Directory dir1 = getTempDirectorySync(parent: sandbox, name: "dir1");
  Directory dir2 = getTempDirectorySync(parent: sandbox, name: "dir2");
  String dir2Name = getEntityName(dir2);

  // create a directory in dir2
  Directory dir3 = getTempDirectorySync(parent: dir2, name: "dir3");

  // create link to the directory dir1
  Link link1 = getTempLinkSync(
      parent: sandbox,
      target: dir1.path,
      name: "link1.lnk");
  // in dir1 create link to dir1
  Link link2 = getTempLinkSync(
      parent: dir1,
      target: ".",
      name: "link2.lnk");
  // in dir1 create link to dir2
  Link link3 = getTempLinkSync(
      parent: dir1,
      target: ".." + Platform.pathSeparator + dir2Name,
      name: "link3.lnk");

  // Try to access dir3 following the links
  String path = link1.path +
      Platform.pathSeparator +
      getEntityName(link2) +
      Platform.pathSeparator +
      getEntityName(link3) +
      Platform.pathSeparator +
      getEntityName(dir3);
  Directory dir = new Directory(path);

  Expect.equals(dir3.path, dir.resolveSymbolicLinksSync());
}
