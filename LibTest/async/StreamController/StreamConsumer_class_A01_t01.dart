/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamConsumer()
 *
 * @description Checks class StreamConsumer.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../StreamSink/inherated_tests_streamcontroller.lib.dart"
        as allTests_StreamConsumer;

StreamController create() {
  return new StreamController();
}

main() {
  allTests_StreamConsumer.test(create);
}

