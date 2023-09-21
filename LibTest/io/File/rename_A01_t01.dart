// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that this method returns a `Future<File>` that completes
/// with a [File] instance for the renamed file.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  file.writeAsStringSync("File content");
  String newName = getTempFilePath(parent: sandbox);

  asyncStart();
  await file.rename(newName).then((renamed) {
    Expect.equals(newName, renamed.path);
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(file.existsSync());
    Expect.equals("File content", renamed.readAsStringSync());
    asyncEnd();
  });
}
