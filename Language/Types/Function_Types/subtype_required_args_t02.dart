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
 * @description Checks that this statement is true for function types with
 * several formal parameters (class, generic, function, Dynamic).
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {}
class A1 {}
class A2 {}
class B implements A, A1, A2 {}
class C implements B {}
class D implements C {}

class G<T, S, U, W> {}

typedef classesFunc(A a, B b, C c, D d);
typedef genericsFunc(Map<num, int> m, List<List<B>> l, G<A, B, C, D> g);
typedef dynamicFunc(var x, var y, var z, var v);
typedef funcFunc(classesFunc f1, genericsFunc f2, dynamicFunc f3);
typedef mixFunc(var x, B b, G<A, B, C, D> g, funcFunc);

typedef okWithClassesFunc_1(A a, A1 b, A1 c, A1 d);
typedef okWithClassesFunc_2(D a, D b, D c, D d);

typedef okWithGenericsFunc_1(Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g);
typedef okWithGenericsFunc_2(Map<int, int> m, List<List<D>> l, G<D, D, D, D> g);

typedef okWithDynamicFunc_1(A x, G g, mixFunc f, var z);
typedef okWithDynamicFunc_2(int x, bool g, List<Map> f, classesFunc z);

f1(D d, B b, C c, A a) {}
f2(A d, A b, A c, A a) {}
f3(D d, A1 b, A1 c, A1 a) {}
f4(D d, A2 b, A2 c, A2 a) {}
f5(D d, D b, D c, D a) {}
f6(var d, var b, var c, var a) {}
f7(Object d, Object b, Object c, Object a) {}

f11(Map<num, num> m, List<List<A1>> l, G<A, A1, A1, A1> g) {}
f12(Map<int, int> m, List<List<D>> l, G<D, D, D, D> g) {}
f13(var m, var l, var g) {}
f14(Object m, Object l, Object g) {}

f21(A x, G g, mixFunc d, var z) {}
f22(int x, bool g, List<Map> d, classesFunc z) {}

f31(okWithClassesFunc_1 a, okWithGenericsFunc_1 b, okWithDynamicFunc_1 c) {}
f32(okWithClassesFunc_2 a, okWithGenericsFunc_2 b, okWithDynamicFunc_2 c) {}

main() {
  Expect.isTrue(f1 is classesFunc);
  Expect.isTrue(f2 is classesFunc);
  Expect.isTrue(f3 is classesFunc);
  Expect.isTrue(f4 is classesFunc);
  Expect.isTrue(f5 is classesFunc);
  Expect.isTrue(f6 is classesFunc);
  Expect.isTrue(f7 is classesFunc);

  Expect.isTrue(f11 is genericsFunc);
  Expect.isTrue(f12 is genericsFunc);
  Expect.isTrue(f13 is genericsFunc);
  Expect.isTrue(f14 is genericsFunc);

  Expect.isTrue(f21 is dynamicFunc);
  Expect.isTrue(f22 is dynamicFunc);

  Expect.isTrue(f31 is funcFunc);
  Expect.isTrue(f32 is funcFunc);
}
