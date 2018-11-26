/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setLastModifiedSync (DateTime time)
 * Synchronously modifies the time the file was last modified.
 *
 * If the attributes cannot be set, throws a FileSystemException.
 * @description Checks that this method modifies the time when file was last
 * modified.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  DateTime oldDate = file.lastModifiedSync();
  DateTime newDate = oldDate.add(new Duration(days: -1));

  file.setLastModifiedSync(newDate);
  Expect.equals(newDate, file.lastModifiedSync());
}
