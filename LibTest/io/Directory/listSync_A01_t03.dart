// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<FileSystemEntity> listSync({
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
/// Broken links are reported as Link objects. If a link makes a loop in the file
/// system, then a recursive listing will not follow a link twice in the same
/// recursive descent, but will report it as a Link the second time it is seen.
///
/// Returns a List containing FileSystemEntity objects for the directories,
/// files, and links.
/// @description Checks that this method lists the sub-directories of this
/// Directory. Test recursive parameter
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

List<String> setUp(Directory parent, Map directories) {
  List<String> created = new List<String>.empty(growable: true);
  directories.forEach((key, value) {
    Directory dir = new Directory(parent.path + Platform.pathSeparator + key);
    dir.createSync();
    created.add(dir.path);
    if (value != null) {
      created.addAll(setUp(dir, value));
    }
  });
  return created;
}

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) {
  Directory dir = sandbox;
  Map struct = {"a": null, "b": null, "c": {"c1": null, "c2": null}, "d": null};
  List<String> created = setUp(dir, struct);

  List<String> found = new List<String>.empty(growable: true);
  dir.listSync(recursive: true).forEach((entity) {
    found.add(entity.path);
  });
  Expect.setEquals(new Set.from(created), new Set.from(found));
}
