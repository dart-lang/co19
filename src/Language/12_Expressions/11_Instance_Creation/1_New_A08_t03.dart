/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A fresh instance i, of class R is allocated. For each instance variable
 * f of i, if the variable declaration of f has an initializer expression ef, then ef is
 * evaluated to an object of and f is bound to of. Otherwise f is bound to null.
 *   Observe that this is not in scope in ef . Hence, the initialization cannot depend
 * on other properties of the object being instantiated.
 * @description Checks that a fresh instance is allocated with every invocation of a redirecting constructor.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {
  A();
  A.redirect():this();
}

main() {
  var a = [];
  for(int i = 0; i < 10; i++) {
    a.addLast(new A.redirect());
    for(int j = 0; j < i; j++) {
      Expect.isFalse(identical(a[j], a[i]));
    }
  }
}
