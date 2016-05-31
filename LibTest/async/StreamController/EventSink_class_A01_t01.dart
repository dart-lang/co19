/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventSink()
 *
 * @description Checks class EventSink.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../StreamSink/allTests.lib.dart" as allTests_EventSink;


EventSink create() {
  return new StreamController();
}

main() {
  allTests_EventSink.test(create);
}

