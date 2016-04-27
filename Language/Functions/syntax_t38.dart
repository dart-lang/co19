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
 * @description Checks different valid variants of synchronous
 * generator functions
 *
 * @author a.semenov@unipro.ru
 */
import '../../Utils/expect.dart';

Iterable<String> a1() sync* {
  yield 'a';
}

Iterable a2() sync* {
  yield 1;
}

a3() sync* {
  yield 2;
}

Iterable<String> b1(int x) sync* {
  yield new String.fromCharCode(x + 'a'.codeUnitAt(0));
}

Iterable b2(String y) sync* {
  yield y.length;
}

b3(z) sync* {
  yield z;
}

main() {
  Expect.equals('a', a1().first);
  Expect.equals(1, a2().first);
  Expect.equals(2, a3().first);
  Expect.equals('e', b1(4).first);
  Expect.equals(5, b2('hello').first);
  Expect.equals(b3, b3(b3).first);
}
