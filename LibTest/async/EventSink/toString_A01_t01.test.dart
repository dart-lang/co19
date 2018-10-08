/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 *
 * @description Checks that to String method returns the same string
 * representation of different EventSink objects.
 * @author ngl@unipro.ru
 */
library toString_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(EventSink create()) {
  EventSink es1 = create();
  EventSink es2 = create();

  Expect.isTrue(es1.toString() is String);
  Expect.isTrue(es2.toString() is String);
  Expect.notEquals(es1, es2);
  Expect.equals(es1.toString(), es2.toString());
}

