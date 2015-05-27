/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if S does not have an accessible
 * instance member named m unless S or a superinterface of S is annotated
 * with an annotation denoting a constant identical to the constant @proxy
 * deﬁned in dart:core.
 * @static-clean
 * @description Checks that there is no static type warning if superclass
 * does not have an instance member named m but its superinterface is
 * annotated with @proxy.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

@proxy
class I {}

class S implements I {}

class A extends S {
  test() {
    super.nonExistingMethod();
  }
}

main() {
  A a=new A();
  Expect.throws((){
    a.test();
  }
  , (e)=>e is NoSuchMethodError
  );
}