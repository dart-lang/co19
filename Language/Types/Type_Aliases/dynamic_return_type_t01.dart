/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In either case, iff no return type is specified, it is taken to
 * be dynamic.
 * @description checks that function types with various return types
 * are all subtypes of given type t1 that declares no return type, therefore
 * the return type of t1 should be dynamic.
 * @static-clean
 * @author iefremov, sgrekhov@unipro.ru
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

typedef F1();

typedef Func();
typedef int Func2(int x);

int ifunc() {}
bool bfunc() {}
String sfunc() {}
Func ffunc() {}
Func2 f2func() {}

main() {
  Expect.isTrue(ifunc is F1);
  Expect.isTrue(bfunc is F1);
  Expect.isTrue(sfunc is F1);
  Expect.isTrue(ffunc is F1);
  Expect.isTrue(f2func is F1);
}

