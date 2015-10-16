/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Except that iff identical(T1, T2) then new T1#m == new T2#m
 *
 * @description Check that if not identical(T1, T2) then new T1#m != new T2#m
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  A.m() {
  }
}

class C extends A {
  C.m(): super.m() {
  }
}

main() {
  Expect.notEquals(new C#m, new A#m);
}
