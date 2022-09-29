// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Stream<FileSystemEntity> list({
///  bool recursive: false,
///  bool followLinks: true
///  })
/// Lists the sub-directories and files of this Directory. Optionally recurses
/// into sub-directories.
///
/// If followLinks is false, then any symbolic links found are reported as Link
/// objects, rather than as directories or files, and are not recursed into.
///
/// If followLinks is true, then working links are reported as directories or
/// files, depending on their type, and links to directories are recursed into.
/// Broken links are reported as Link objects. If a symbolic link makes a loop in
/// the file system, then a recursive listing will not follow a link twice in the
/// same recursive descent, but will report it as a Link the second time it is
/// seen.
///
/// The result is a stream of FileSystemEntity objects for the directories,
/// files, and links.
/// @description Checks that if recursive parameter false then subdirectories are
/// not listed
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

List<String> setUp(Directory parent, Map directories) {
  List<String> expected = [];
  directories.forEach((key, value) {
    Directory dir = new Directory(parent.path + Platform.pathSeparator + key);
    dir.createSync();
    expected.add(dir.path);
    if (value != null) {
      setUp(dir, value);
    }
  });
  return expected;
}

Map getContent(Directory dir) {
  Map found = new Map();
  dir.list(recursive: true).forEach((entity) {
      found.addAll({entity.path: null});
  });
  return found;
}

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = sandbox;
  asyncStart();
  Map struct = {"a": null, "b": null, "c": {"c1": null, "c2": null}, "d": null};
  List<String> expected = setUp(dir, struct);

  List<String> found = [];
  await dir.list(recursive: false).forEach((entity) {
    found.add(entity.path);
  }).then((_) {
    Expect.setEquals(new Set.from(expected), new Set.from(found));
    asyncEnd();
  });
}
