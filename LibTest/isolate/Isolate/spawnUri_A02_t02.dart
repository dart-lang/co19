/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawnUri(Uri uri, List<String> args, message)
 * @description Checks that returned Future throws an exception when URI points
 * to a script that doesn't declare any top-level functions.
 * @author kaigorodov
 * @needsreview dart issue  #15348
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  asyncStart();
  Future fut = Isolate.spawnUri(new Uri.file("spawnUri_A02_t02_bad_isolate.dart"), [], null);
  fut.then((value) {
      Expect.fail("spawnUri(bad library) does not gives an error");
    },
    onError: (error) {
      asyncEnd();
    }
  );
}
