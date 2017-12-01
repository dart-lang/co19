/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future done
 * Get a future that will complete when the consumer closes, or when an error
 * occurs.
 * @description Checks that [done] will complete after the consumer closes
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

bool isDone = false;

main() async {
  StreamController<List<int>> controller = new StreamController<List<int>>();
  dynamic sink = new IOSink(controller);

  sink.done.then((addresses) {
    Expect.isTrue(controller.isClosed);
    isDone = true;
  }, onError: (e) { Expect.fail("Unexpected error appeared: " + e); });

  await controller.close();
  Expect.isTrue(isDone);
}
