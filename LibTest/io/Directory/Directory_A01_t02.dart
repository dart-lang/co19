/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory(String path)
 * Creates a Directory object.
 *
 * If path is a relative path, it will be interpreted relative to the current
 * working directory (see Directory.current), when used.
 *
 * If path is an absolute path, it will be immune to changes to the current
 * working directory.
 * @description Checks that this constructor creates a Directory object. Test
 * relative path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Directory dir = new Directory("");
  Expect.equals(Directory.current.path + Platform.pathSeparator,
      dir.absolute.path);
}
