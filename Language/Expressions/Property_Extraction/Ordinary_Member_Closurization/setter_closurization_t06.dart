/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of setter f on object o is defined to be
 * equivalent to (a){return u.m = a;} if f is named m =, except that iff
 * identical(o1, o2) then o1#m= == o2#m=.
 *
 * @description Check that if identical(o1, o2) then implicit setter
 * o1#m= == o2#m=
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int m;
}

main() {
  C o1 = new C();
  C o2 = o1;

  Expect.isTrue(o1#m= == o2#m=);
}
