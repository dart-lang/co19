/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventSync abstract class
 *
 * @description Checks that all members of EventSync are implemented.
 * @note Tests run with ../StreamController/EventSink_class_A01_t01.dart
 * @author ngl@unipro.ru
 */
library all_tests_eventsink;
import "dart:async";

import "EventSink_A01_t01.test.dart" as EventSink_A01_t01;
import "hashCode_A01_t01.test.dart" as hashCode_A01_t01;
import "runtimeType_A01_t01.test.dart" as runtimeType_A01_t01;
import "equality_operator_A01_t01.test.dart" as equality_operator_A01_t01;
import "add_A01_t01.test.dart" as add_A01_t01;
import "addError_A01_t01.test.dart" as addError_A01_t01;
import "close_A01_t01.test.dart" as close_A01_t01;
import "noSuchMethodError_A01_t01.test.dart" as noSuchMethodError_A01_t01;
import "toString_A01_t01.test.dart" as toString_A01_t01;

test(EventSink create()) {
  EventSink_A01_t01.test(create);
  hashCode_A01_t01.test(create);
  runtimeType_A01_t01.test(create);
  equality_operator_A01_t01.test(create);
  add_A01_t01.test(create);
  addError_A01_t01.test(create);
  close_A01_t01.test(create);
  noSuchMethodError_A01_t01.test(create);
  toString_A01_t01.test(create);
}
