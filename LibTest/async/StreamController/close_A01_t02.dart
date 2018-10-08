/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Tells the stream sink that no further streams will be added.
 *
 * Returns a future which is completed when the stream sink has shut down.
 *
 * @description Checks that the stream is closed.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  controller.close();
  asyncStart();
  controller.stream.listen(
    (value) {
     Expect.fail("unexpected onData call");
    },
    onError: (error1) {
      Expect.fail("unexpected onError call");
    },
    onDone: () {
      asyncEnd();
    }
  );
}
