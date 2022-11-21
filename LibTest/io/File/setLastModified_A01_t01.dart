// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future setLastAccessed(DateTime time)
/// Modifies the time the file was last accessed.
///
/// Throws a FileSystemException if the time cannot be set.
/// @description Checks that this method modifies the time the file was last
/// modified
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  DateTime oldDate = file.lastModifiedSync();
  DateTime newDate = oldDate.add(new Duration(seconds: -1));

  asyncStart();
  await file.setLastModified(newDate).then((_) {
    Expect.equals(newDate, file.lastModifiedSync());
    asyncEnd();
  });
}
