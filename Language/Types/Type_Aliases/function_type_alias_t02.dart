// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The effect of a type alias of the form
/// typedef T id(T1 p1, ..., Tn pn, [Tn+1 pn+1, ..., Tn+k pn+k]) declared in a
/// library L is to introduce the name id into the scope of L, bound to the
/// function type (T1, ..., Tn, [Tn+1 pn+1, ..., Tn+k pn+k ]) -> T.
/// The effect of a type alias of the form
/// typedef T id(T1 p1, ..., Tn pn, {Tn+1 pn+1, ..., Tn+k pn+k]} declared in a
/// library L is to introduce the name id into the scope of L, bound to the
/// function type (T1, ..., Tn, {Tn+1 pn+1, ..., Tn+k pn+k }) -> T.
/// @description Trivially checks that a function type alias with a single
/// parameter and a return type also introduces a new name for a type.
/// @author iefremov, sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

typedef int F(int i);
typedef int G(int i);

int f(int i) => 0;
int g() => 0;

main() {
  Expect.isTrue(f is F);
  Expect.isTrue(f is G);
  Expect.runtimeIsType<F>(f);
  Expect.runtimeIsType<G>(f);

  Expect.isFalse(g is F);
  Expect.isFalse(g is G);
  Expect.runtimeIsNotType<F>(g);
  Expect.runtimeIsNotType<G>(g);
}
