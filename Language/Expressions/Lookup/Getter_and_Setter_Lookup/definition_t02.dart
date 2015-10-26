/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of a getter (respectively setter) m in
 * class C with respect to library L is: If C declares a concrete instance
 * getter (respectively setter) named m that is accessible to L, then that
 * getter (respectively setter) is the result of the lookup. Otherwise, if C
 * has a superclass S, then the result of the lookup is the result of looking
 * up getter (respectively setter) m in S with respect to L. Otherwise, we say
 * that the lookup has failed.
 * @description Checks that the setter of superclass is found if there is no
 * appropriately named setter in class C.
 * @author msyabro, sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class SS {
  var value;
  set v(val) {
    value = val;
  }
}

class S extends SS {}

class C extends S {}

main() {
  var o = new C();
  o.v = 1;
  Expect.equals(1, o.value);
}
