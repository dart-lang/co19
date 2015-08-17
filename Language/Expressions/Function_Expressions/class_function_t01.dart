/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The class of a function literal implements the built-in class
 * Function.
 * @description Checks that a function literal implements interface Function.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.isTrue(() {} is Function);
  Expect.isTrue((() => 1) is Function);
  Expect.isTrue(((p1, p2) {}) is Function);
  Expect.isTrue(((p1, [int p2]) {}) is Function);
  Expect.isTrue(((p1, {int p2: 1}) {}) is Function);
}
