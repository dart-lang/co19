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
 * @description Checks different valid variants of asynchronous static methods
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

// f() async => expression;
class A {
  static Future<String> a1() async => 'a1';

  static Future a2() async => 0;

  static Future<int> a3() async => 1;
}

// f() { statements }
class B {
  static Future<String> b1() async {
    return 'b1';
  }

  static Future b2() async {
    return 2;
  }

  static Future<int> b3() async {
    return 3;
  }
}
// f(arg) async => expression;
class C {
  static Future<String> c1(int x) async => 'c' + x.toString();

  static Future c2(String y) async => y.length;

  static Future c3(z) async => z;
}

// f(arg) { statements }
class D {
  static Future<String> d1(int x) async {
    return 'd' + x.toString();
  }

  static Future d2(String y) async {
    return y.length;
  }

  static Future d3(z) async {
    return z;
  }
}
main() {
  asyncStart();
  Future.wait([
    A.a1(), A.a2(), A.a3(),
    B.b1(), B.b2(), B.b3(),
    C.c1(10), C.c2('hello'), C.c3(C.c3),
    D.d1(15), D.d2('world'), D.d3(D.d3)
  ]).then(
      (_) {
        asyncEnd();
      }
  );
}
