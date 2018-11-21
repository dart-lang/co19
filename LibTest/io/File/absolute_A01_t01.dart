/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion File absolute
 * Returns a File instance whose path is the absolute path to this.
 *
 * The absolute path is computed by prefixing a relative path with the current
 * working directory, and returning an absolute path unchanged.
 * @description Checks that this property returns a File instance whose
 * path is the absolute path to this
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  Expect.isNotNull(file.absolute);
  Expect.equals(file.path, file.absolute.path);

  String fileName = getTempFileName();
  file = new File(fileName);
  Expect.isNotNull(file.absolute);
  Expect.equals(Directory.current.path + Platform.pathSeparator + fileName,
      file.absolute.path);
}
