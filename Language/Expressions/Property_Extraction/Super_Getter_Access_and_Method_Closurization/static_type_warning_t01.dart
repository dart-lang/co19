/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static type warning if S does not have an accessible
 * instance method or getter named m.
 * @description Checks that it is a static warning if the class of super in
 * a super.m invocation does not have a getter named m.
 * @static-warning
 * @author ilya
 */
import '../../../../Utils/expect.dart';

class S {}

class C extends S {
  C() {
    Expect.throws(() => super.foo); /// static warning
  }
}

main() {
  new C();
}
