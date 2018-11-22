/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> target()
 * Gets the target of the link. Returns a future that completes with the path to
 * the target.
 *
 * If the returned target is a relative path, it is relative to the directory
 * containing the link.
 *
 * If the link does not exist, or is not a link, the future completes with a
 * FileSystemException.
 * @description Check that this method returns the target of the link. Test
 * directory as a target and the relative path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory parent = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: parent);
  Link link = new Link(
      target.path + Platform.pathSeparator + getTempFileName(extension: ".lnk"));
  link.createSync("..");

  asyncStart();
  await link.target().then((String path) {
    if (Platform.isWindows) {
      Expect.equals(parent.path + Platform.pathSeparator, path);
    } else {
      Expect.equals("..", path);
    }
    asyncEnd();
  });
}
