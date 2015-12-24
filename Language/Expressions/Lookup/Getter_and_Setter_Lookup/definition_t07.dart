/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that implicit getters and setters are found during lookup
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  var m = -1;
}

main()  {
  C o = new C();
  Expect.equals(-1, o.m);
  o.m = 1;
  Expect.equals(1, o.m);
}
