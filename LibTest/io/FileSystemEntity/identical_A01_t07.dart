/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> identical(
 *  String path1,
 *  String path2
 *  )
 * Checks whether two paths refer to the same object in the file system. Returns
 * a Future<bool> that completes with the result.
 *
 * Comparing a link to its target returns false, as does comparing two links
 * that point to the same target. To check the target of a link, use Link.target
 * explicitly to fetch it. Directory links appearing inside a path are followed,
 * though, to find the file system object.
 *
 * Completes the returned Future with an error if one of the paths points to an
 * object that does not exist.
 * @description Checks that this method completes with true if two paths refer
 * to the same object in the file system. Test absolute paths for links
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link = getTempLinkSync(parent: sandbox);
  bool result = await FileSystemEntity.identical(link.path, link.path);
  Expect.isTrue(result);
}
