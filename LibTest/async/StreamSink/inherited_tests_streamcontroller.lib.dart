/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventSync and StreamConsumer are abstract classes
 *
 * @description Run all tests of EventSynk and StreamConsumer.
 * @author ngl@unipro.ru
 */
library inherited_tests_streamcontroller;
import "dart:async";

import "../EventSink/all_tests.lib.dart" as allTest_EventSink;
import "../StreamConsumer/all_tests.lib.dart" as allTest_StreamConsumer;

test(StreamSink create()) {
  allTest_EventSink.test(create);
  allTest_StreamConsumer.test(create);
}
