// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion File renameSync(String newPath)
/// Synchronously renames this file.
///
/// Returns a [File] for the renamed file.
///
/// If [newPath] is a relative path, it is resolved against the current working
/// directory ([Directory.current]). This means that simply changing the name of
/// a file, but keeping it the original directory, requires creating a new
/// complete path with the new name at the end. Example:
/// ```dart
/// File changeFileNameOnlySync(File file, String newFileName) {
///   var path = file.path;
///   var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
///   var newPath = path.substring(0, lastSeparator + 1) + newFileName;
///   return file.renameSync(newPath);
/// }
/// ```
/// On some platforms, a rename operation cannot move a file between different
/// file systems. If that is the case, instead [copySync] the file to the new
/// location and then [deleteSync] the original.
///
/// If [newPath] identifies an existing file or link, that entity is removed
/// first. If [newPath] identifies an existing directory the operation throws a
/// [FileSystemException].
///
/// @note Shortly:
/// - [File]/[Link] `rename/renameSync` can replace other [File]/[Link] but not
///   [Directory]
/// - [Directory] `rename/renameSync` can not replace an existing
///   [File]/[Link]/[Directory] except on POSIX where it can replace an empty
///   [Directory]
///
/// @description Checks that if [newPath] identifies an existing directory the
/// operation fails and an exception is thrown.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) {
  File file = getTempFileSync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: sandbox);

  Expect.throws(() {
    file.renameSync(target.path);
  });

  Expect.isTrue(file.existsSync());
  Expect.isTrue(target.existsSync());
}
