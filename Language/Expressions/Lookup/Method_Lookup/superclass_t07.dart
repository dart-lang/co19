/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of method m in class C with respect to
 * library L is: If C declares a concrete instance method named m that is
 * accessible to L, then that method is the result of the lookup. Otherwise,
 * if C has a superclass S, then the result of the lookup is the result of
 * looking up m in S with respect to L. Otherwise, we say that the method
 * lookup has failed.
 * @description Checks that inaccessible methods are skipped during lookup
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';
import 'superclass_lib.dart' as lib;

class B extends lib.A {
  int _m() => 2;
}

main() {
  dynamic b = new B();
  Expect.equals(2, b._m());
  Expect.throws(() {b._privateMethod();}, (e) => e is NoSuchMethodError);
}
