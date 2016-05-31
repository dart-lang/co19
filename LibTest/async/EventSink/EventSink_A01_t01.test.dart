/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventSink()
 *
 * @description Checks that an istance of EventSink may be created.
 * @author ngl@unipro.ru
 */
library EventSink_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(EventSink create()) {
  EventSink es = create();

  Expect.isTrue(es is EventSink);
}

