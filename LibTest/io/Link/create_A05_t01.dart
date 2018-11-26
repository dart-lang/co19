/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Link> create(
 *  String target, {
 *  bool recursive: false
 *  })
 * Creates a symbolic link. Returns a Future<Link> that completes with the link
 * when it has been created. If the link exists, the future will complete with
 * an error.
 *
 * If recursive is false, the default, the link is created only if all
 * directories in its path exist. If recursive is true, all non-existing path
 * components are created. The directories in the path of target are not
 * affected, unless they are also in path.
 *
 * On the Windows platform, this will only work with directories, and the target
 * directory must exist. The link will be created as a Junction. Only absolute
 * links will be created, and relative paths to the target will be converted to
 * absolute paths by joining them with the path of the directory the link is
 * contained in.
 *
 * On other platforms, the posix symlink() call is used to make a symbolic link
 * containing the string target. If target is a relative path, it will be
 * interpreted relative to the directory containing the link.
 * @description Checks that on the Windows platform  only absolute links will be
 * created, and relative paths to the target will be converted to absolute paths
 * by joining them with the path of the directory the link is contained in.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  if (Platform.isWindows) {
    Directory dir = getTempDirectorySync(parent: sandbox);
    String dirName = getTempDirectoryName();
    Directory target = new Directory(dir.path +
        Platform.pathSeparator + dirName);
    target.createSync();
    Link link = new Link(dir.path + Platform.pathSeparator +
        getTempFileName(extension: "lnk"));
    asyncStart();
    await link.create(dirName).then((Link created) {
      Expect.equals(target.path, created.targetSync());
      asyncEnd();
    });
  }
}
