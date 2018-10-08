/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController({void onListen(), void onPause(),
 *                  void onResume(), dynamic onCancel(), bool sync: false})
 * The controller buffers all incoming events until a subscriber is registered,
 * but this feature should only be used in rare circumstances.
 *
 * @description Checks that the controller will buffer all incoming data and
 * errors until the subscriber is registered.
 * @issue #29461
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

void check(List source) {
  StreamController controller = new StreamController();

  for (var event in source) {
    if (event is num && event < 0) {
      controller.addError(event);
    } else {
      controller.add(event);
    }
  }

  Expect.throws(() => controller.close());
}

main() {
  check([]);
  check([-1, -2, -3, -4, -5]);
  check([1, 2, -3, 4, -5, 6, 7, -8, 9, 0]);
}
