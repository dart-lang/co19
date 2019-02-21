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
 * @description Trivially checks that a function type alias (with no arguments) introduces
 * a new name for a type.
 * @author iefremov, sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

typedef F();
typedef G();

f() {}

main() {
  Expect.isTrue(f is F);
  Expect.isTrue(f is G);
}
