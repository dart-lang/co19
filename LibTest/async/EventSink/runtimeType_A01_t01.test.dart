/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type runtimeType
 * A representation of the runtime type of the object.
 *
 * @description Checks usage of runtimeType property.
 * @author ngl@unipro.ru
 */
library runtimeType_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(EventSink create()) {
  EventSink es1 = create();
  EventSink es2 = create();
  Object o = new Object();

  Expect.isTrue(es1.runtimeType is Type);
  Expect.isTrue(es2.runtimeType is Type);
  Expect.equals(es1.runtimeType, es2.runtimeType);
  Expect.notEquals(es1.runtimeType, o.runtimeType);
}

