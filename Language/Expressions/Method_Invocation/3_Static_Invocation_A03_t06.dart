/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if C does not declare a static method or getter m.
 * @description Checks that it is a static warning if C has an instance getter named m 
 * instead of a static method.
 * @author rodionov
 * @reviewer kaigorodov
 * @static-warning
 */
import "../../../Utils/expect.dart";

class C {
  var m = (){};
}

main() {
  Expect.throws(() => C.m()); // static warning
}
