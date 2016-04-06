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
 * @description Checks that this statement is true even if the subtype function
 * type has more positional optional parameters than the supertype as long as the
 * supertype's positional optional parameters match the beginning of the list of
 * subtype's positional optional parameters.
 * @author iefremov
 * @reviewer rodionov
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

class A {}
class A1 {}
class A2 {}
class B implements A, A1, A2 {}
class C implements B {}
class D implements C {}

class G<T, S, U, W> {}

typedef classesFunc(A aa, [A a, B b, C c, D d]);
typedef genericsFunc([Map<num, int> m, List<List<B>> l, G<A, B, C, D> g]);
typedef dynamicFunc([var x, var y, var z, var v]);
typedef funcFunc([classesFunc f1, genericsFunc f2, dynamicFunc f3]);
typedef mixFunc([var x, B b, G<A, B, C, D> g, funcFunc f]);

typedef okWithClassesFunc_1(A aa, [A a, A1 b, A1 c, A1 d]);
typedef okWithClassesFunc_2(A aa, [D a, D b, D c, D d]);

typedef okWithGenericsFunc_1(
    [Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g]);
typedef okWithGenericsFunc_2(
    [Map<int, int> m, List<List<D>> l, G<D, D, D, D> g]);

typedef okWithDynamicFunc_1([A x, G y, mixFunc z, var v]);
typedef okWithDynamicFunc_2([int x, bool y, List<Map> z, classesFunc v]);


main() {
  Expect.isTrue((var vv, [D a, B b, C c, A d, var xx, Map xxx, Object xxxx]) {} is classesFunc);

  Expect.isTrue(([var m, var l, var g, var xx, var xxx, var xxxx]) {} is genericsFunc);

  Expect.isTrue(([A x, G y, mixFunc z, var v, Object xx, List<Map<int, mixFunc>> xxx, mixFunc xxxx]) {} is dynamicFunc);

  Expect.isTrue(([okWithClassesFunc_2 f1, okWithGenericsFunc_2 f2, okWithDynamicFunc_2 f3, mixFunc xx, funcFunc xxx]) {} is funcFunc);
}
