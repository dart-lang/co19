/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Link> update(String target)
 * Updates the link. Returns a Future<Link> that completes with the link when it
 * has been updated. Calling update on a non-existing link will complete its
 * returned future with an exception.
 *
 * On the Windows platform, this will only work with directories, and the target
 * directory must exist.
 * @description Check that calling update on a non-existing link will complete
 * its returned future with an exception. Test the case when target does not
 * exist
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  String newTarget = getTempDirectoryPath(parent: sandbox);
  Link link = new Link(getTempFilePath(parent: sandbox));
  link.createSync(target.path);
  asyncStart();
  await link.update(newTarget).then((Link l) {
    Expect.equals(newTarget, link.targetSync());
    asyncEnd();
  });
}
