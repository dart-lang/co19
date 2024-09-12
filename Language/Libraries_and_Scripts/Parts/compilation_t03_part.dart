// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Compiling a part directive of the form `part s;` causes the Dart
/// system to attempt to compile the contents of the URI that is the value of
/// `s`. The top-level declarations at that URI are then compiled by the Dart
/// compiler in the scope of the current library.
///
/// @description Checks that the top level declarations at URI are compiled in
/// the scope of the current library (including private declarations).

part of 'compilation_t03.dart';

foo() { return null; }
int bar(int x, int y) { return x + y ; }
List list(int iParam) { return new List.filled(iParam, 0); }
_privateFunc() { return 0; }

typedef String func<B extends bool, S extends String>(B t, [S sParam]);

get value { return _value; }
set value(value) { _value = value; }
var _value;

final int i = -100;
final bool b = false;
final String s = "string";
final List<int> l = const [0, 1, 2, 3];
final Map<String, int> m = const {'a': 1, 'b': 2};
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
