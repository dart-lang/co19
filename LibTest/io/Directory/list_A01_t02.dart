/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<FileSystemEntity> list({
 *  bool recursive: false,
 *  bool followLinks: true
 *  })
 * Lists the sub-directories and files of this Directory. Optionally recurses
 * into sub-directories.
 *
 * If followLinks is false, then any symbolic links found are reported as Link
 * objects, rather than as directories or files, and are not recursed into.
 *
 * If followLinks is true, then working links are reported as directories or
 * files, depending on their type, and links to directories are recursed into.
 * Broken links are reported as Link objects. If a symbolic link makes a loop in
 * the file system, then a recursive listing will not follow a link twice in the
 * same recursive descent, but will report it as a Link the second time it is
 * seen.
 *
 * The result is a stream of FileSystemEntity objects for the directories,
 * files, and links.
 * @description Checks that this method lists the sub-directories of this
 * Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

List<String> setUp(Directory parent, List<String> directories) {
  List<String> created = new List<String>();
  directories.forEach((item) {
    Directory dir = new Directory(parent.path + Platform.pathSeparator + item);
    dir.createSync();
    created.add(dir.path);
  });
  return created;
}

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  List<String> expected = ["a", "b", "c", "d"];
  expected = setUp(dir, expected);

  asyncStart();
  List<String> found = new List<String>();
  await dir.list().forEach((entity) {
    found.add(entity.path);
  }).then((_) {
    Expect.setEquals(new Set.from(expected), new Set.from(found));
    asyncEnd();
  });
}
