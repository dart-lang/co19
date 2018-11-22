/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String targetSync()
 * Synchronously gets the target of the link. Returns the path to the target.
 *
 * If the returned target is a relative path, it is relative to the directory
 * containing the link.
 *
 * If the link does not exist, or is not a link, throws a FileSystemException.
 * @description Check that this method returns the target of the link. Test
 * дштл as a target
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link target = getTempLinkSync(parent: sandbox);
  Link link = new Link(getTempFilePath(parent: sandbox));
  link.createSync(target.path);
  Expect.equals(target.path, link.targetSync());
}
