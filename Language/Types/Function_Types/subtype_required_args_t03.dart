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
 * @description Checks that formal parameter names have no effect on determining
 * whether or not a function is a subtype of another, only their types are
 * important.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

typedef f(int someComplexName);

main() {
  Expect.isTrue((int someOtherComplexName6031769) {} is f);
  Expect.isFalse((double someComplexName) {} is f);
}
