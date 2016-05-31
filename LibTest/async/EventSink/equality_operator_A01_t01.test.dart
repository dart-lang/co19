/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The default behavior for all Objects is to return true if and only if this
 * and other are the same object.
 *
 * @description Checks the equality operator.
 * @author ngl@unipro.ru
 */
library equality_operator_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(EventSink create()) {
  EventSink es1 = create();
  EventSink es2 = create();
  EventSink es3 = es1;

  Expect.isFalse(es1 == es2);
  Expect.isTrue(es1 == es3);
}

