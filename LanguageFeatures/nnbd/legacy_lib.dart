/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
library legacy_library_lib;

import 'dart:async';

class A implements AMx {
  int c1 = 0, c2 = 0;
  String get log => "test() called $c1 times, text2 called $c2 times";

  void foo() {}
  String test() {
    c1++;
    return "Lily was here";
  }
  String text = "Let it be";
  String get text2 {
    c2++;
    return text;
  }
  void set text3(String val) {
    this.text = val;
  }
  int operator[](int index) => index;
  void operator[]=(int index, var value) => value;

  AMx c = new AMx();
}

class C<X extends A> {
  X x;
  C(this.x);
}

class B<X extends int> {
  X x;
  B(this.x);
}

class M {
}

class Mx {
  int iMx = 42;
}

class AMx {
  String text = "No woman, no cry";
}

mixin Mxn on AMx {
  String sMxn = "Show must go on";
}

abstract class I {}

class Const {
  const Const();
}

int iLegacy = 42;
int nLegacy = null;
String sLegacy = "Yesterday, All my troubles seemed so far away";
A aLegacy = new A();

class S {}

S getLegacyS() => null;

dynamic get legacyDynamic => new Object();

dynamic getLegacyDynamic(x) => x;

Null getLegacyNull() => null;

FutureOr<Null> futureOrNull = null;

FutureOr futureOrDynamic = new Object();

FutureOr<FutureOr<S>> futureOrfutureOrS = new S();

void legacyFoo() {}

typedef void LegacyFoo();

Function fLegacy1 = legacyFoo;
LegacyFoo fLegacy2 = legacyFoo;

class F1<X extends Function> {
  X x;
  F1(this.x);
}
class F2<X extends LegacyFoo> {
  X x;
  F2(this.x);
}

F1<Function> funcLegacy1 = F1<Function>(legacyFoo);
F2<LegacyFoo> funcLegacy2 = F2<LegacyFoo>(legacyFoo);
