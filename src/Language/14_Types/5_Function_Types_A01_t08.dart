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
 * @description Checks that this statement is true for function types with several formal parameters
 * (abstract class, generic, function, Dynamic).
 * @author iefremov
 * @reviewer rodionov
 */

abstract class A {}
abstract class A1 {}
abstract class A2 {}
abstract class B implements A, A1, A2 {}
abstract class C implements B {}
abstract class D implements C {}

class G<T, S, U, W> {}

typedef interfacesFunc(A a, B b, C c, D d);
typedef genericsFunc(Map<num, int> m, List<List<B>> l, G<A, B, C, D> g);
typedef dynamicFunc(var x, var y, var z, var v);
typedef funcFunc(interfacesFunc f1, genericsFunc f2, dynamicFunc f3);
typedef mixFunc(var x, B b, G<A, B, C, D> g, funcFunc);

typedef okWithInterfacesFunc_1(A a, A1 b, A1 c, A1 d);
typedef okWithInterfacesFunc_2(D a, D b, D c, D d);

typedef okWithGenericsFunc_1(Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g);
typedef okWithGenericsFunc_2(Map<int, int> m, List<List<D>> l, G<D, D, D, D> g);

typedef okWithDynamicFunc_1(A x, G g, mixFunc f, var z);
typedef okWithDynamicFunc_2(int x, bool g, List<Map> f, interfacesFunc z);


main() {
  Expect.isTrue(f(D d, B b, C c, A a) {} is interfacesFunc);
  Expect.isTrue(f(A d, A b, A c, A a) {} is interfacesFunc);
  Expect.isTrue(f(D d, A1 b, A1 c, A1 a) {} is interfacesFunc);
  Expect.isTrue(f(D d, A2 b, A2 c, A2 a) {} is interfacesFunc);
  Expect.isTrue(f(D d, D b, D c, D a) {} is interfacesFunc);
  Expect.isTrue(f(var d, var b, var c, var a) {} is interfacesFunc);
  Expect.isTrue(f(Object d, Object b, Object c, Object a) {} is interfacesFunc);

  Expect.isTrue(f(Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g) {} is genericsFunc);
  Expect.isTrue(f(Map<int, int> m, List<List<D>> l, G<D, D, D, D> g) {} is genericsFunc);
  Expect.isTrue(f(var m, var l, var g) {} is genericsFunc);
  Expect.isTrue(f(Object m, Object l, Object g) {} is genericsFunc);

  Expect.isTrue(f(A x, G g, mixFunc d, var z) {} is dynamicFunc);
  Expect.isTrue(f(int x, bool g, List<Map> d, interfacesFunc z) {} is dynamicFunc);

  Expect.isTrue(f(okWithInterfacesFunc_1 a, okWithGenericsFunc_1 b, okWithDynamicFunc_1 c) {} is funcFunc);
  Expect.isTrue(f(okWithInterfacesFunc_2 a, okWithGenericsFunc_2 b, okWithDynamicFunc_2 c) {} is funcFunc);
}
