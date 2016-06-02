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

test(StreamConsumer create()) {
  StreamConsumer sc1 = create();
  StreamConsumer sc2 = create();
  Object o = new Object();

  Expect.isTrue(sc1.runtimeType is Type);
  Expect.isTrue(sc2.runtimeType is Type);
  Expect.equals(sc1.runtimeType, sc2.runtimeType);
  Expect.notEquals(sc1.runtimeType, o.runtimeType);
}

