/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic noSuchMethod(Invocation invocation)
 * Invoked when a non-existent method or property is accessed.
 *
 * @description Checks that if a non-existent method or property is accessed a
 * method noSuchMethod is invoked. The default behavior of a noSuchMethod is to
 * throw a NoSuchMethodError.
 * @author ngl@unipro.ru
 */
library noSuchMethodError_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(StreamConsumer create()) {
  dynamic cs1 = create();

  try {
    cs1.m1();   /// static type warning
  } catch (e) {
    Expect.isTrue(e is NoSuchMethodError);
  }
  try {
    cs1.abc;   /// static type warning
  } catch (e) {
    Expect.isTrue(e is NoSuchMethodError);
  }
}

