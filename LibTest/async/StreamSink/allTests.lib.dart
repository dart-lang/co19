/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventSync abstract class
 *
 * @description Checks that all members of EventSync are implemented.
 * @author ngl@unipro.ru
 */
library allTests_A01_t01;
import "dart:async";

import "../EventSink/allTests.lib.dart" as allTest_EventSink;

test(EventSink create()) {
  allTest_EventSink.test(create);
}
