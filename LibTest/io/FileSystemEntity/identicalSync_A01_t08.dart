// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool identicalSync(
///  String path1,
///  String path2
///  )
/// Synchronously checks whether two paths refer to the same object in the file
/// system.
///
/// Comparing a link to its target returns false, as does comparing two links
/// that point to the same target. To check the target of a link, use Link.target
/// explicitly to fetch it. Directory links appearing inside a path are followed,
/// though, to find the file system object.
///
/// Throws an error if one of the paths points to an object that does not exist.
/// @description Checks that this method completes with true if two paths refer
/// to the same object in the file system. Test absolute and relative paths
/// for link
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  Directory sandbox = getTempDirectorySync(parent: Directory.current);
  await inSandbox(_main, sandbox: sandbox);
}

void _main(Directory sandbox) {
  String linkName = getTempFileName();
  File target = getTempFileSync(parent: sandbox);
  Link link = new Link(sandbox.path + Platform.pathSeparator + linkName);
  link.createSync(target.path);
  Expect.isTrue(FileSystemEntity.identicalSync(
      link.path, getEntityName(sandbox) + Platform.pathSeparator + linkName));
  Expect.isTrue(FileSystemEntity.identicalSync(
      getEntityName(sandbox) + Platform.pathSeparator + linkName, link.path));
}
