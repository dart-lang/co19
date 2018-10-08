/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Link> rename(String newPath)
 * Renames this link. Returns a Future<Link> that completes with a Link instance
 * for the renamed link.
 *
 * If newPath identifies an existing link, that link is replaced. If newPath
 * identifies an existing file or directory, the operation fails and the future
 * completes with an exception.
 * @description Checks that if newPath identifies an existing link, that link is
 * replaced
 * @author sgrekhov@unipro.ru
 * @issue 30687
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Link link = getTempLinkSync();
  Link ren = null;
  Link target = getTempLinkSync();
  String target1 = link.targetSync();
  String target2 = target.targetSync();

  asyncStart();
  link.rename(target.path).then((renamed) {
    ren = renamed;
    Expect.equals(target.path, renamed.path);
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(link.existsSync());
    Expect.equals(target1, renamed.targetSync());
    asyncEnd();
  }).whenComplete(() {
    if (ren != null) {
      ren.delete();
    }
    if (link.existsSync()) {
      deleteLinkWithTarget(link);
    }
    new Directory(target2).delete();
  });
}
