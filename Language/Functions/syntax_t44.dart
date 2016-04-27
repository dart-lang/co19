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
 * @description Checks different valid variants of static synchronous
 * generator methods
 *
 * @author a.semenov@unipro.ru
 */
import '../../Utils/expect.dart';

class A {
  static Iterable<String> a1() sync* {
    yield 'a';
  }

  static Iterable a2() sync* {
    yield 1;
  }

  static a3() sync* {
    yield 2;
  }
}

class B {
  static Iterable<String> b1(int x) sync* {
    yield new String.fromCharCode(x + 'a'.codeUnitAt(0));
  }

  static Iterable b2(String y) sync* {
    yield y.length;
  }

  static b3(z) sync* {
    yield z;
  }
}

main() {
  Expect.equals('a', A.a1().first);
  Expect.equals(1, A.a2().first);
  Expect.equals(2, A.a3().first);
  Expect.equals('e', B.b1(4).first);
  Expect.equals(5, B.b2('hello').first);
  Expect.equals(B.b3, B.b3(B.b3).first);
}
