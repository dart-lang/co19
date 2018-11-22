/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link(String path)
 * Creates a Link object.
 * @description Checks that this constructor creates a Link object. Test
 * that file system objects are accessible via created link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  // create Directory
  Directory dir = getTempDirectorySync(parent: sandbox);
  // create file in this directory
  String fileName = getTempFileName();
  getTempFileSync(parent: dir, name: fileName);
  // create link to the directory
  Link link = getTempLinkSync(target: dir.path, parent: sandbox);

  // try to access the file
  String path = link.path + Platform.pathSeparator + fileName;
  File f = new File(path);
  Expect.isTrue(f.existsSync());
}
