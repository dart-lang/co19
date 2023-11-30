// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<Link> update(String target)
/// Updates the link. Returns a Future<Link> that completes with the link when it
/// has been updated. Calling update on a non-existing link will complete its
/// returned future with an exception.
///
/// On the Windows platform, this will only work with directories, and the target
/// directory must exist.
/// @description Check that calling update on a non-existing link will complete
/// its returned future with an exception.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

void _main(Directory sandbox) async {
  Directory target = getTempDirectorySync(parent: sandbox);
  Directory newTarget = getTempDirectorySync(parent: sandbox);
  Link link = new Link(getTempFilePath(parent: sandbox));

  asyncStart();
  await link.update(newTarget.path).then((Link l) {
    Expect.fail("FileSystemException is expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
