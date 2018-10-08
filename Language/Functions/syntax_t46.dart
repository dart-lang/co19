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
 * @description Checks different valid variants of static asynchronous
 * generator methods
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

class A {
  static Stream<int> a1() async* {
    yield 1;
  }

  static Stream a2() async* {
    yield 1;
  }

  static Stream<int> a3() async* {
    yield 2;
  }
}

class B {
  static Stream<String> b1(int x) async* {
    yield 'a' + new String.fromCharCode(x);
  }

  static Stream b2(String s) async* {
    yield s.length;
  }

  static Stream b3(z) async* {
    yield z;
  }
}

main() {
  asyncStart();
  Future.wait([
    A.a1().first, A.a2().first, A.a3().first,
    B.b1(70).first, B.b2('hello').first, B.b3(B.b3).first
  ]).then(
      (_) {
        asyncEnd();
      }
  );
}
