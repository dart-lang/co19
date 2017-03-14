/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic noSuchMethod(Invocation invocation)
 * Invoked when a non-existent method or property is accessed.
 * Classes can override noSuchMethod to provide custom behavior.
 * If a value is returned, it becomes the result of the original invocation.
 * The default behavior is to throw a NoSuchMethodError.
 * @description Checks that noSuchMethod() is invoked when a non-existent
 * method or property is accessed and by default throws NoSuchMethodError
 * @author sgrekhov@unipro.ru
 */
library noSuchMethod_A01_t01;
import "../../../Utils/expect.dart";

test(Object create()) {
  dynamic o = create();

  Expect.throws(() {o.noSuchMethod_A01_t01;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {o.noSuchMethod_A01_t01();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {o.noSuchMethod_A01_t01 = 1;}, (e) => e is NoSuchMethodError);
}
