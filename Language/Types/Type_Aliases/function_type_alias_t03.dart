/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a type alias of the form
 * typedef T id(T1 p1, ..., Tn pn, [Tn+1 pn+1, ..., Tn+k pn+k]) declared in a
 * library L is is to introduce the name id into the scope of L, bound to the
 * function type (T1, ..., Tn, [Tn+1 pn+1, ..., Tn+k pn+k ]) -> T.
 * The effect of a type alias of the form
 * typedef T id(T1 p1, ..., Tn pn, {Tn+1 pn+1, ..., Tn+k pn+k]} declared in a
 * library L is is to introduce the name id into the scope of L, bound to the
 * function type (T1, ..., Tn, {Tn+1 pn+1, ..., Tn+k pn+k }) -> T.
 * @description Checks that this is true for more complex function signatures.
 * @author iefremov, sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {}
abstract class I {}

typedef void F(int i, String s, C c, I i2, var v, List a, List<int> a2,
    [int opti, String opts, C optc, I opti2, var optv, List opta,
      List<int> opta2]);

void f(int i, String s, C c, I i2, var v, List a, List<int> a2,
    [int opti, String opts, C optc, I opti2, var optv, List opta,
      List<int> opta2]) {}

typedef void G(int i, String s, C c, {int opti, String opts, C optc});

void g(int i, String s, C c, {int opti, String opts, C optc}) {}

main() {
  Expect.isTrue(f is F);
  Expect.isTrue(g is G);

  Expect.isFalse(g is F);
  Expect.isFalse(f is G);
}
