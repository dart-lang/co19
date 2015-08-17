/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Let T be the static type of e. It is a static type warning if
 * T does not have a getter named m unless T or a superinterface of T is
 * annotated with an annotation denoting a constant identical to the constant @proxy
 * deﬁned in dart:core. 
 * @description Checks that it is a static warning if the class of super in
 * a super.m invocation does not have a getter named m.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class S {}

class C extends S {
  C() {
    Expect.throws(() => super.foo); /// static warning
  }
}

main() {
  new C();
}