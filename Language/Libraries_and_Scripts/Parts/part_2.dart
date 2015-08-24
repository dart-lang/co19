// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of Parts_test_lib;

foo() { return null; }
int bar(int x, int y) { return x + y ; }
List list(int iParam) { return new List(iParam); }
_privateFunc() {return 0;}

typedef String func<B extends bool, S extends String>(B t, [S sParam]);

get value { return _value; }
set value(value) { _value = value; }
var _value;


final int i = -100;
final bool b = false;
final String s = "string";
final List l = const [0,1,2,3];
final Map m = const {'a': 1, 'b': 2};
final String e = "One"  "Two";
final _private = 'private';

class A {
  A() {}
  foo() { return "a.foo()"; }
  var bar = "a.bar";
  static final FOO = "A.FOO";
  get value { return _value; }
  set value(val) { _value = val; }

  var _value;
}
