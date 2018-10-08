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
 * representation of different StreamConsumer objects.
 * @author ngl@unipro.ru
 */
library toString_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(StreamConsumer create()) {
  StreamConsumer sc1 = create();
  StreamConsumer sc2 = create();

  Expect.isTrue(sc1.toString() is String);
  Expect.isTrue(sc2.toString() is String);
  Expect.notEquals(sc1, sc2);
  Expect.equals(sc1.toString(), sc2.toString());
}

