// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In either case, iff no return type is specified, it is taken to
/// be dynamic.
/// @description checks that function types with various return types
/// are all subtypes of given type t1 that declares no return type, therefore
/// the return type of t1 should be dynamic.
/// @author iefremov, sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

typedef F1();

typedef Func();
typedef int Func2(int x);

int ifunc() => 42;
bool bfunc() => false;
String sfunc() => "Lili was here";
Func ffunc() => () {};
Func2 f2func() => (int x) => 42;

main() {
  Expect.isTrue(ifunc is F1);
  Expect.isTrue(bfunc is F1);
  Expect.isTrue(sfunc is F1);
  Expect.isTrue(ffunc is F1);
  Expect.isTrue(f2func is F1);
  checkType(checkIs<F1>, true, ifunc);
  checkType(checkIs<F1>, true, bfunc);
  checkType(checkIs<F1>, true, sfunc);
  checkType(checkIs<F1>, true, ffunc);
  checkType(checkIs<F1>, true, f2func);
}

