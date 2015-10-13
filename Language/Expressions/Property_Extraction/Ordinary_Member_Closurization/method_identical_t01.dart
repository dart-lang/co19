/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Except that iff identical(o1, o2) then o1#m == o2#m,
 * o1.m == o2.m, o1#m == o2.m and o1.m == o2#m.
 *
 * @description Check that if o1 != o2 then o1#m != o2#m, o1.m != o2.m,
 * o1#m != o2.m and o1.m != o2#m
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int m() => 1;
}

main() {
  C o1 = new C();
  C o2 = new C();
  Expect.isFalse(o1#m == o2#m);
  Expect.isFalse(o1.m == o2.m);
  Expect.isFalse(o1#m == o2.m);
  Expect.isFalse(o1.m == o2#m);
}
