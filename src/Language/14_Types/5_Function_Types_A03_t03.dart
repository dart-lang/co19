/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, {Tx1 x1, ..., Txk xk}) -> T is a subtype of the function
 * type (S1, ..., Sn, {Sy1 y1, ..., Sym ym }) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. For all i 1 <= i <= n, Ti <=> Si.
 * 3. k >= m and yi belongs to {x1, ..., xk} for each i in 1..m.
 * 4. For all y in {y1, ..., ym}, yi = xj  =>  Tj <=> Si
 * @description Checks that this statement is true even if the subtype function type has more named optional
 * parameters than the supertype as long it's a superset of the supertype's named optional parameters.
 * @author rodionov
 */

class A {}
class A1 {}
class A2 {}
class B implements A, A1, A2 {}
class C implements B {}
class D implements C {}

class G<T, S, U, W> {}

typedef classesFunc(A aa, {A a, B b, C c, D d});
typedef genericsFunc({Map<num, int> m, List<List<B>> l, G<A, B, C, D> g});
typedef dynamicFunc({var x, var y, var z, var v});
typedef funcFunc({classesFunc f1, genericsFunc f2, dynamicFunc f3});
typedef mixFunc({var x, B b, G<A, B, C, D> g, funcFunc f});

typedef okWithClassesFunc_1(A aa, {A a, A1 b, A1 c, A1 d});
typedef okWithClassesFunc_2(A aa, {D a, D b, D c, D d});

typedef okWithGenericsFunc_1({Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g});
typedef okWithGenericsFunc_2({Map<int, int> m, List<List<D>> l, G<D, D, D, D> g});

typedef okWithDynamicFunc_1({A x, G y, mixFunc z, var v});
typedef okWithDynamicFunc_2({int x, bool y, List<Map> z, classesFunc v});


main() {
  Expect.isTrue((var vv, {D a, var xx, B b, Map xxx, C c, Object xxxx, A d}) {} is classesFunc);

  Expect.isTrue(({var x, var l, var g, var xx, var m, var xxxx}) {} is genericsFunc);

  Expect.isTrue(({A x, G y, mixFunc z, var v, Object xx, List<Map<int, mixFunc>> xxx, mixFunc xxxx}) {} is dynamicFunc);

  Expect.isTrue(({okWithClassesFunc_2 f1, funcFunc xxx, okWithDynamicFunc_2 f3, okWithGenericsFunc_2 f2, mixFunc xx}) {} is funcFunc);
}
