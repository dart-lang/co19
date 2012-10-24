/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, [Tx1 x1, ..., Txk xk]) -> T is a subtype of the function
 * type (S1, ..., Sn, [Sy1 y1, ..., Sym ym ]) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. For all i 1 <= i <= n, Ti <=> Si.
 * 3. k >= m and xi = yi , for each i in 1..m.
 * 4. For all y, {y1 , . . . , ym} Sy <=> Ty
 * @description Checks that this statement is true even if the subtype function type has more optional
 * parameters than the supertype as long as the supertype's optional parameters match the beginning
 * of the list of subtype's optional parameters.
 * @author rodionov
 * @reviewer iefremov
 */

abstract class A {}
abstract class A1 {}
abstract class A2 {}
abstract class B implements A, A1, A2 {}
abstract class C implements B {}
abstract class D implements C {}

class G<T, S, U, W> {}

typedef interfacesFunc(A aa, [A a, B b, C c, D d]);
typedef genericsFunc([Map<num, int> m, List<List<B>> l, G<A, B, C, D> g]);
typedef dynamicFunc([var x, var y, var z, var v]);
typedef funcFunc([interfacesFunc f1, genericsFunc f2, dynamicFunc f3]);
typedef mixFunc([var x, B b, G<A, B, C, D> g, funcFunc f]);

typedef okWithInterfacesFunc_1(A aa, [A a, A1 b, A1 c, A1 d]);
typedef okWithInterfacesFunc_2(A aa, [D a, D b, D c, D d]);

typedef okWithGenericsFunc_1([Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g]);
typedef okWithGenericsFunc_2([Map<int, int> m, List<List<D>> l, G<D, D, D, D> g]);

typedef okWithDynamicFunc_1([A x, G y, mixFunc z, var v]);
typedef okWithDynamicFunc_2([int x, bool y, List<Map> z, interfacesFunc v]);


main() {
  Expect.isTrue(f(var vv, [D a, B b, C c, A d, var xx, Map xxx, Object xxxx]) {} is interfacesFunc);

  Expect.isTrue(f([var m, var l, var g, var xx, var xxx, var xxxx]) {} is genericsFunc);

  Expect.isTrue(f([A x, G y, mixFunc z, var v, Object xx, List<Map<int, mixFunc>> xxx, mixFunc xxxx]) {} is dynamicFunc);

  Expect.isTrue(f([okWithInterfacesFunc_2 f1, okWithGenericsFunc_2 f2, okWithDynamicFunc_2 f3, mixFunc xx, funcFunc xxx]) {} is funcFunc);
}
