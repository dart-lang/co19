// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the second and last step, if no error occurred, proceed as
/// described in the first applicable case from the following list:
/// ...
/// - Consider the case where `D` is a formal type parameter declaration of a
///   class or a mixin. It is a compile-time error if `ℓ` occurs inside a static
///   method, static getter, or static setter, or inside a static variable
///   initializer. Otherwise, the lexical lookup yields `D`.
///
/// @description Checks that if `D` is a formal type parameter declaration and
/// `ℓ` occurs inside a non-static method, getter, setter, or inside a instance
/// variable initializer then the lexical lookup yields `D`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C<T> {
  C.constructor() {
    Expect.equals('$int', T.toString());
  }
  void method() {
    Expect.equals('$int', T.toString());
  }
  int get getter {
    Expect.equals('$int', T.toString());
    return 0;
  }
  void set setter(int _) {
    Expect.equals('$int', T.toString());
  }
  Type variable = T;
}

mixin M<T> {
  void method() {
    Expect.equals('$int', T.toString());
  }
  int get getter {
    Expect.equals('$int', T.toString());
    return 0;
  }
  void set setter(int _) {
    Expect.equals('$int', T.toString());
  }
  Type variable = T;
}

enum E<T> {
  e0<int>();

  void method() {
    Expect.equals('$int', T.toString());
  }
  int get getter {
    Expect.equals('$int', T.toString());
    return 0;
  }
  void set setter(int _) {
    Expect.equals('$int', T.toString());
  }
  final Type variable = T;
}

class A {}

extension Ext<T> on A {
  void method() {
    Expect.equals('$int', T.toString());
  }
  int get getter {
    Expect.equals('$int', T.toString());
    return 0;
  }
  void set setter(int _) {
    Expect.equals('$int', T.toString());
  }
}

extension type ET<T>._(int _) {
  ET.constructor(this._) {
    Expect.equals('$int', T.toString());
  }
  void method() {
    Expect.equals('$int', T.toString());
  }
  int get getter {
    Expect.equals('$int', T.toString());
    return 0;
  }
  void set setter(int _) {
    Expect.equals('$int', T.toString());
  }
}

class MA = Object with M<int>;

main() {
  var c = C<int>.constructor();
  c.method();
  c.getter;
  c.setter = 0;
  Expect.equals('$int', '${c.variable}');

  var m = MA();
  m.method();
  m.getter;
  m.setter = 0;
  Expect.equals('$int', '${m.variable}');

  E.e0.method();
  E.e0.getter;
  E.e0.setter = 0;
  Expect.equals('$int', '${E.e0.variable}');

  var a = A();
  Ext<int>(a).method();
  Ext<int>(a).getter;
  Ext<int>(a).setter = 0;

  var et = ET<int>.constructor(0);
  et.method();
  et.getter;
  et.setter = 0;
}
