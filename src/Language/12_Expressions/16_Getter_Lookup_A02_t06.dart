/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of a getter (respectively setter) m in class C with
 * respect to library L is: If C declares a concrete instance getter (respectively setter)
 * named m that is accessible to L, then that getter (respectively setter) is the
 * result of the lookup. Otherwise, if C has a superclass S, then the result of the
 * lookup is the result of looking up getter (respectively setter) m in S with respect
 * to L. Otherwise, we say that the lookup has failed.
 * @description Checks that inherited abstract getters and setters are skipped
 * in a lookup.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class S {
  var field;
}

class S1 extends S{
  get field;     // static warning: abstract method in a concrete class
  set field (x); // static warning: abstract method in a concrete class
}

class C extends S1{
}

main()  {
  var x = new C();

  try {
    x.field;
  } catch(e) {
    Expect.fail('Concrete getter from superclass is not called');
  }

  try {
    x.field = 1;
  } catch(e) {
    Expect.fail('Concrete setter from superclass is not called');
  }
}
