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

test(Stdout sink) async {
  int isDone = 0;

  sink.done.then((addresses) {
     isDone++;
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });

  Expect.equals(0, isDone);
  await sink.close();
  Expect.equals(1, isDone);
}

main() {
  test(stdout);
  test(stderr);
}
