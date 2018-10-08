/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Functions include function declarations, methods, getters,
 * setters, constructors and function literals.
 * All functions have a signature and a body.
 * functionSignature:
 *   metadata returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   async? '=>' expression ';' | (async | async* | sync*)? block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 *
 * @description Checks different valid variants of asynchronous methods
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

// f() async => expression;
class A {
  Future<String> a1() async => 'a1';

  Future a2() async => 0;

  Future<int> a3() async => 1;
}

// f() { statements }
class B {
  Future<String> b1() async {
    return 'b1';
  }

  Future b2() async {
    return 2;
  }

  Future<int> b3() async {
    return 3;
  }
}
// f(arg) async => expression;
class C {
  Future<String> c1(int x) async => 'c' + x.toString();

  Future c2(String y) async => y.length;

  Future c3(z) async => z;
}

// f(arg) { statements }
class D {
  Future<String> d1(int x) async {
    return 'd' + x.toString();
  }

  Future d2(String y) async {
    return y.length;
  }

  Future d3(z) async {
    return z;
  }
}
main() {
  asyncStart();
  A a = new A();
  B b = new B();
  C c = new C();
  D d = new D();
  Future.wait([
    a.a1(), a.a2(), a.a3(),
    b.b1(), b.b2(), b.b3(),
    c.c1(10), c.c2('hello'), c.c3(c.c3),
    d.d1(15), d.d2('world'), d.d3(d.d3)
  ]).then(
      (_) {
        asyncEnd();
      }
  );
}
