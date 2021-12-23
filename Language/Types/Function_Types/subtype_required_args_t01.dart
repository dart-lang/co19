// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
/// the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
/// conditions are met:
/// 1. Either
///    • S is void, or
///    • T <=> S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
/// @description Checks that this statement is true for function types with a
/// single formal parameter (class, generic, function, Dynamic).
/// @author iefremov
/// @issue 42648

// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

typedef t1(B b);
typedef t2(C c);
typedef t3(int i);
typedef t4(var v);
typedef t5(Map m);
typedef t6(Map<int, num> m);
typedef t7(t1 f);
typedef t8(Object f);

typedef okWithF1_1(A a);
typedef okWithF1_2(B a);
typedef okWithF1_3(C a);
typedef okWithF1_4(D a);

f1(A a) {}
f2(B a) {}
f3(C a) {}
f4(D a) {}
f5(Object a) {}
f6(var a) {}

f10(A a) {}
f11(B a) {}
f12(C a) {}
f13(D a) {}
f14(Object a) {}
f15(var a) {}

f20(num n) {}
f21(int i) {}
f22(Object a) {}
f23(var a) {}

f30(A a) {}
f31(B a) {}
f32(C a) {}
f33(D a) {}
f34(Object a) {}
f35(var a) {}
f36(num n) {}
f37(int i) {}
f38(Map a) {}
f39(Map<List<Map<List, List<int>>>, List> a) {}
f40(List a) {}
f41(t8 a) {}
f42(t7 a) {}

f50(Map m) {}
f51(Map<List, t8> m) {}
f52(Object m) {}
f53(var m) {}
f54(Map<List, List> m) {}
f55(Map<int, t8> m) {}

f61(Map<num, num> m) {}
f62(Map<int, int> m) {}
f63(Map m) {}
f64(Object m) {}
f65(var m) {}

f71(okWithF1_1 g) {}
f72(okWithF1_2 g) {}
f73(okWithF1_3 g) {}
f74(okWithF1_4 g) {}

f81(A a) {}
f82(B a) {}
f83(C a) {}
f84(D a) {}
f85(Object a) {}
f86(var a) {}
f87(num n) {}
f88(int i) {}
f89(Map a) {}
f90(Map<List<Map<List, List<int>>>, List> a) {}
f91(List a) {}

main() {
  Expect.isTrue(f1 is t1);
  Expect.isTrue(f2 is t1);
  Expect.isFalse(f3 is t1);
  Expect.isFalse(f4 is t1);
  Expect.isTrue(f5 is t1);
  Expect.isTrue(f6 is t1);
  Expect.runtimeIsType<t1>(f1);
  Expect.runtimeIsType<t1>(f2);
  Expect.runtimeIsNotType<t1>(f3);
  Expect.runtimeIsNotType<t1>(f4);
  Expect.runtimeIsType<t1>(f5);
  Expect.runtimeIsType<t1>(f6);

  Expect.isTrue(f10 is t2);
  Expect.isTrue(f11 is t2);
  Expect.isTrue(f12 is t2);
  Expect.isFalse(f13 is t2);
  Expect.isTrue(f14 is t2);
  Expect.isTrue(f15 is t2);
  Expect.runtimeIsType<t2>(f10);
  Expect.runtimeIsType<t2>(f11);
  Expect.runtimeIsType<t2>(f12);
  Expect.runtimeIsNotType<t2>(f13);
  Expect.runtimeIsType<t2>(f14);
  Expect.runtimeIsType<t2>(f15);

  Expect.isTrue(f20 is t3);
  Expect.isTrue(f21 is t3);
  Expect.isTrue(f22 is t3);
  Expect.isTrue(f23 is t3);
  Expect.runtimeIsType<t3>(f20);
  Expect.runtimeIsType<t3>(f21);
  Expect.runtimeIsType<t3>(f22);
  Expect.runtimeIsType<t3>(f23);

  Expect.isFalse(f30 is t4);
  Expect.isFalse(f31 is t4);
  Expect.isFalse(f32 is t4);
  Expect.isFalse(f33 is t4);
  Expect.isFalse(f34 is t4);
  Expect.isTrue(f35 is t4);
  Expect.isFalse(f36 is t4);
  Expect.isFalse(f37 is t4);
  Expect.isFalse(f38 is t4);
  Expect.isFalse(f39 is t4);
  Expect.isFalse(f40 is t4);
  Expect.isFalse(f41 is t4);
  Expect.isFalse(f42 is t4);
  Expect.runtimeIsNotType<t4>(f30);
  Expect.runtimeIsNotType<t4>(f31);
  Expect.runtimeIsNotType<t4>(f32);
  Expect.runtimeIsNotType<t4>(f33);
  Expect.runtimeIsNotType<t4>(f34);
  Expect.runtimeIsType<t4>(f35);
  Expect.runtimeIsNotType<t4>(f36);
  Expect.runtimeIsNotType<t4>(f37);
  Expect.runtimeIsNotType<t4>(f38);
  Expect.runtimeIsNotType<t4>(f39);
  Expect.runtimeIsNotType<t4>(f40);
  Expect.runtimeIsNotType<t4>(f41);
  Expect.runtimeIsNotType<t4>(f42);

  Expect.isTrue(f50 is t5);
  Expect.isFalse(f51 is t5);
  Expect.isTrue(f52 is t5);
  Expect.isTrue(f53 is t5);
  Expect.isFalse(f54 is t5);
  Expect.isFalse(f55 is t5);
  Expect.runtimeIsType<t5>(f50);
  Expect.runtimeIsNotType<t5>(f51);
  Expect.runtimeIsType<t5>(f52);
  Expect.runtimeIsType<t5>(f53);
  Expect.runtimeIsNotType<t5>(f54);
  Expect.runtimeIsNotType<t5>(f55);

  Expect.isTrue(f61 is t6);
  Expect.isFalse(f62 is t6);
  Expect.isTrue(f63 is t6);
  Expect.isTrue(f64 is t6);
  Expect.isTrue(f65 is t6);
  Expect.runtimeIsType<t6>(f61);
  Expect.runtimeIsNotType<t6>(f62);
  Expect.runtimeIsType<t6>(f63);
  Expect.runtimeIsType<t6>(f64);
  Expect.runtimeIsType<t6>(f65);

  Expect.isFalse(f71 is t7);
  Expect.isTrue(f72 is t7);
  Expect.isTrue(f73 is t7);
  Expect.isTrue(f74 is t7);
  Expect.runtimeIsNotType<t7>(f71);
  Expect.runtimeIsType<t7>(f72);
  Expect.runtimeIsType<t7>(f73);
  Expect.runtimeIsType<t7>(f74);

  Expect.isFalse(f81 is t8);
  Expect.isFalse(f82 is t8);
  Expect.isFalse(f83 is t8);
  Expect.isFalse(f84 is t8);
  Expect.isTrue(f85 is t8);
  Expect.isTrue(f86 is t8);
  Expect.isFalse(f87 is t8);
  Expect.isFalse(f88 is t8);
  Expect.isFalse(f89 is t8);
  Expect.isFalse(f90 is t8);
  Expect.isFalse(f91 is t8);
  Expect.runtimeIsNotType<t8>(f81);
  Expect.runtimeIsNotType<t8>(f82);
  Expect.runtimeIsNotType<t8>(f83);
  Expect.runtimeIsNotType<t8>(f84);
  Expect.runtimeIsType<t8>(f85);
  Expect.runtimeIsType<t8>(f86);
  Expect.runtimeIsNotType<t8>(f87);
  Expect.runtimeIsNotType<t8>(f88);
  Expect.runtimeIsNotType<t8>(f89);
  Expect.runtimeIsNotType<t8>(f90);
  Expect.runtimeIsNotType<t8>(f91);
}
