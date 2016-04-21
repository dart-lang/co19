// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Imports_A02_p1_lib;

List bList(int i) { return new List(i); }
typedef String bFunc<B extends bool, S extends String>(B t, [S s]);
final bFoo = "B_FOO";

class B {
  B () {}
  B.spec () {}
  foo() { return "1_Imports_A02_p1_lib.foo()"; }
  var bar = "1_Imports_A02_p1_lib.bar";
  //static final FOO = "B.FOO";
  get value { return _value; }
  set value(val) { _value = val; }

  var _value;
}

class F implements I {
  var _value;
  F() {}
  foo() { return "i.foo()"; }
  get value { return _value; }
  set value(val) { _value = val; }
}

abstract class I {
  factory I() = F;
  I.c() {}
  //static final FOO = "I.FOO";
  String foo();
  get value;
  set value(val);
  var _value;
}
