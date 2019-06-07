/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String modeString()
 * Returns the mode value as a human-readable string, in the format "rwxrwxrwx",
 * reflecting the user, group, and world permissions to read, write, and execute
 * the file system object, with "-" replacing the letter for missing
 * permissions. Extra permission bits may be represented by prepending "(suid)",
 * "(guid)", and/or "(sticky)" to the mode string.
 * @description Checks that this property returns value as a human-readable
 * string
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
  FileStat fs = FileStat.statSync(file.path);
  if (Platform.isWindows) {
    Expect.equals("rw-rw-rw-", fs.modeString());
  } else {
    Expect.isTrue(new RegExp("rw-[r-][w-]-[r-][w-]").hasMatch(fs.modeString()));
  }
}
