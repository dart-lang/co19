/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The interface of class C is an implicit interface that declares 
 * instance members that correspond to the instance members declared by C, and 
 * whose direct superinterfaces are the direct superinterfaces of C. When a 
 * class name appears as type, that name denotes the interface of the class.
 * @description Checks that a class can be used as an interface.
 * @author msyabro
 */
import "../../Utils/expect.dart";

abstract class A {}
class C {}

class B implements A {}
class D implements C {}

main() {
  var b = new B();
  Expect.isTrue(b is A);

  var d = new D();
  Expect.isTrue(d is C);
}
