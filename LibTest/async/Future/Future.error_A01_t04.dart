/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.error(error, [Object stackTrace])
 * A future that completes with an error in the next event-loop iteration.
 * The error must not be null.
 *
 * @description Checks that error mustn't be null
 * @author sgrekhov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    new Future.error(null);
  });
}
