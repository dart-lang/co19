/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool existsSync()
 * Synchronously checks whether the file system entity with this path exists.
 *
 * Since FileSystemEntity is abstract, every FileSystemEntity object is actually
 * an instance of one of the subclasses File, Directory, and Link. Calling
 * existsSync on an instance of one of these subclasses checks whether the
 * object exists in the file system object exists and is of the correct type
 * (file, directory, or link). To check whether a path points to an object on
 * the file system, regardless of the object's type, use the typeSync static
 * method.
 * @description Checks that this method synchronously checks whether the file
 * system entity with this path exists. Test link
 * @author sgrekhov@unipro.ru
 * @issue 30873
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link = getTempLinkSync(parent: sandbox);
  Directory dir = new Directory(link.path);
  Expect.isFalse(dir.existsSync());
}
