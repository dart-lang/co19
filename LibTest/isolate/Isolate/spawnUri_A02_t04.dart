/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawnUri(Uri uri, List<String> args, message)
 * Creates and spawns an isolate that runs the code from the library with the specified URI.
 * @description Checks that returned Future throws an exception when URI points
 * to an unexistent file.
 * @author kaigorodov
 * @needsreview dart issue  #12617
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  asyncStart();
  Future fut = Isolate.spawnUri(new Uri.file("IntentionallyMissingFile.dart"), [], null);
  fut.then((value) {
      Expect.fail("spawnUri(bad library) does not gives an error");
    },
    onError: (error) {
      asyncEnd();
    }
  );
}
