/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of getter f on object o is defined to be
 * equivalent to (){return u.m;} if f is named m, except that iff
 * identical(o1, o2) then o1#m == o2#m.
 *
 * @description Check that closurization of implicit getter is equivalent to
 * (){return u.m;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int m = -2;
}

main() {
  C o = new C();
  var f = o#m;

  var f1 = () {return o.m;};

  Expect.equals(f(), f1());
}
