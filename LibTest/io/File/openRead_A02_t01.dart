/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<List<int>> openRead([int start, int end])
 * Create a new independent Stream for the contents of this file.
 *
 * If start is present, the file will be read from byte-offset start. Otherwise
 * from the beginning (index 0).
 *
 * If end is present, only up to byte-index end will be read. Otherwise, until
 * end of file.
 *
 * In order to make sure that system resources are freed, the stream must be
 * read to completion or the subscription on the stream must be cancelled.
 * @description Checks that returned stream can be listened to
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  List<int> content = [3, 1, 4, 1, 5, 9, 2, 6];
  file.writeAsBytesSync(content);
  asyncStart();
  final c = new Completer();
  StreamSubscription<List<int>> s = null;
  s = await file.openRead().listen((data) async {
    Expect.isTrue(data.length <= content.length);
    for (int i = 0; i < data.length; i++) {
      Expect.equals(content[i], data[i]);
    }
    await s.cancel();
    c.complete();
    asyncEnd();
  });
  return c.future;
}
