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
/// @description Checks that this statement is true for function types with no
/// arguments: S is some type, T is some other type assignable to S.
/// @author iefremov
/// @issue 42648

// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

typedef returnsDynamic();
typedef Object returnsObject();
typedef num returnsNum();

  //() -> T is () -> dynamic
void f1() {}
int f2() => 42;
String f3() => "Lily was here";
double f4() => 3.14;
Object f5() => new Object();
returnsDynamic? f6() {}
List f7() => [];
List<int> f8() => [3, 1, 4];
Map<int, List<List<List>>>? f9() {}
  //() -> T is () -> Object
int f10() => 0;
String f11() => "";
double f12() => 0;
Object f13() => "";
List f14() => [];
List<int> f15() => [3, 1, 4];
Map<int, List<List<List>>>? f16() {}
  //() -> T is () -> num
int f17() => 1;
double f18() => 2;
num f19() => 3;

main() {
  //() -> T is () -> dynamic
  Expect.isTrue(f1 is returnsDynamic);
  Expect.isTrue(f2 is returnsDynamic);
  Expect.isTrue(f3 is returnsDynamic);
  Expect.isTrue(f4 is returnsDynamic);
  Expect.isTrue(f5 is returnsDynamic);
  Expect.isTrue(f6 is returnsDynamic);
  Expect.isTrue(f7 is returnsDynamic);
  Expect.isTrue(f8 is returnsDynamic);
  Expect.isTrue(f9 is returnsDynamic);
  checkType(checkIs<returnsDynamic>, true, f1);
  checkType(checkIs<returnsDynamic>, true, f2);
  checkType(checkIs<returnsDynamic>, true, f3);
  checkType(checkIs<returnsDynamic>, true, f4);
  checkType(checkIs<returnsDynamic>, true, f5);
  checkType(checkIs<returnsDynamic>, true, f6);
  checkType(checkIs<returnsDynamic>, true, f7);
  checkType(checkIs<returnsDynamic>, true, f8);
  checkType(checkIs<returnsDynamic>, true, f9);

  //() -> T is () -> Object
  Expect.isTrue(f10 is returnsObject);
  Expect.isTrue(f11 is returnsObject);
  Expect.isTrue(f12 is returnsObject);
  Expect.isTrue(f13 is returnsObject);
  Expect.isTrue(f14 is returnsObject);
  Expect.isTrue(f15 is returnsObject);
  Expect.isFalse(f16 is returnsObject);
  checkType(checkIs<returnsObject>, true, f10);
  checkType(checkIs<returnsObject>, true, f11);
  checkType(checkIs<returnsObject>, true, f12);
  checkType(checkIs<returnsObject>, true, f13);
  checkType(checkIs<returnsObject>, true, f14);
  checkType(checkIs<returnsObject>, true, f15);
  checkType(checkIs<returnsObject>, false, f16);

  //() -> T is () -> num
  Expect.isTrue(f17 is returnsNum);
  Expect.isTrue(f18 is returnsNum);
  Expect.isTrue(f19 is returnsNum);
  checkType(checkIs<returnsNum>, true, f17);
  checkType(checkIs<returnsNum>, true, f18);
  checkType(checkIs<returnsNum>, true, f19);
}
