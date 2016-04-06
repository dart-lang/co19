/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
 * the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
 * conditions are met:
 * 1. Either
 *    • S is void, or
 *    • T <=> S.
 * 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
 * @description Assertion means that as long function type t1 has no more
 * required parameters and no less total positional parameters than function
 * type t2, types of extra positional parameters of t1 do not matter for subtype
 * relation. Under this condition, checks that t1 is subtype of t2 if their
 * parameter types are assignable on t2 parameters set range, and t1 has extra
 * optional positional parameters of some arbitary type.
 * @author ilya
 */
import "../../../Utils/expect.dart";

typedef t1(int x);
typedef t2(int x, int y);

class Whatever {}

main() {
  Expect.isTrue(([int x, Whatever w]) {} is t1);
  Expect.isTrue(([var x, Whatever w, Whatever w2]) {} is t1);
  Expect.isTrue((int x, [int y, Whatever w]) {} is t2);
  Expect.isTrue((int x, [int y, Whatever w, Whatever w2]) {} is t2);
  Expect.isTrue(([int x, int y, Whatever w, Whatever w2]) {} is t2);
}
