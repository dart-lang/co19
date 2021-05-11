// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future.microtask(dynamic computation())
///    Creates a future containing the result of calling computation
/// asynchronously with scheduleMicrotask.
///    If executing computation throws, the returned future is completed with the
/// thrown error.
/// @description Checks that if computation() throws, the created future
/// is completed with the same error.
/// @author ilya
/// @issue 42525

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var value = [1, 2, 3];
  asyncStart();
  new Future.microtask(() {
    bool b = true;
    if (b) {
      throw value;
    }
    return 42;
  })
    .catchError((e) {
      Expect.identical(value, e);
      asyncEnd();
      return 0;
    });
}
