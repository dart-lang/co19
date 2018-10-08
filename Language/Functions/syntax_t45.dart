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
 * @description Checks different valid variants of asynchronous
 * generator methods
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

class A {
  Stream<int> a1() async* {
    yield 1;
  }

  Stream a2() async* {
    yield 1;
  }

  Stream a3() async* {
    yield 2;
  }
}

class B {
  Stream<String> b1(int x) async* {
    yield 'a' + new String.fromCharCode(x);
  }

  Stream b2(String s) async* {
    yield s.length;
  }

  Stream b3(z) async* {
    yield z;
  }
}

main() {
  asyncStart();
  A a = new A();
  B b = new B();
  Future.wait([
    a.a1().first, a.a2().first, a.a3().first,
    b.b1(70).first, b.b2('hello').first, b.b3(b.b3).first
  ]).then(
      (_) {
        asyncEnd();
      }
  );
}
