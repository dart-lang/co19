// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> timeout(Duration timeLimit, {dynamic onTimeout()})
/// Time-out the future computation after timeLimit has passed.
/// . . .
/// If this future does not complete before timeLimit has passed, the onTimeout
/// action is executed instead, and its result (whether it returns or throws) is
/// used as the result of the returned future. The onTimeout function must return
/// a T or a Future<T>.
///
/// @description Checks that if future does not complete before timeLimit has
/// passed, the onTimeout action is executed instead. The onTimeout returns value
/// 56.
/// @author ngl@unipro.ru
/// @author a.semenov@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  Completer completer = new Completer();
  completer.future
      .timeout(new Duration(microseconds: 1), onTimeout: () => 56)
      .then((value) {
    Expect.equals(56, value);
    asyncEnd();
  });
}
