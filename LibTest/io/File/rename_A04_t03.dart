// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<File> rename(String newPath)
/// Renames this file. Returns a `Future<File>` that completes with a [File]
/// instance for the renamed file.
///
/// If [newPath] is a relative path, it is resolved against the current working
/// directory ([Directory.current]). This means that simply changing the name of
/// a file, but keeping it the original directory, requires creating a new
/// complete path with the new name at the end. Example:
/// ```dart
/// Future<File> changeFileNameOnly(File file, String newFileName) {
///   var path = file.path;
///   var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
///   var newPath = path.substring(0, lastSeparator + 1) + newFileName;
///   return file.rename(newPath);
/// }
/// ```
/// On some platforms, a rename operation cannot move a file between different
/// file systems. If that is the case, instead [copy] the file to the new
/// location and then remove the original.
///
/// If [newPath] identifies an existing file or link, that entity is removed
/// first. If [newPath] identifies an existing directory, the operation fails
/// and the future completes with a [FileSystemException]
///
/// @note Shortly:
/// - [File]/[Link] `rename/renameSync` can replace other [File]/[Link] but not
///   [Directory]
/// - [Directory] `rename/renameSync` can not replace an existing
///   [File]/[Link]/[Directory] except on POSIX where it can replace an empty
///   [Directory]
///
/// @description Checks that if [newPath] identifies an existing link to another
/// link, that link is replaced
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  File linkTarget = getTempFileSync(parent: sandbox);
  Link link1 = getTempLinkSync(parent: sandbox, target: linkTarget.path);
  Link link2 = getTempLinkSync(parent: sandbox, target: link1.path);
  file.writeAsStringSync("Source");

  asyncStart();
  await file.rename(link2.path).then((renamed) {
    Expect.equals(link2.path, renamed.path);
    Expect.isTrue(renamed.existsSync());
    Expect.equals("Source", renamed.readAsStringSync());
    Expect.isFalse(file.existsSync());
    Expect.isFalse(link2.existsSync());
    asyncEnd();
  });
}
