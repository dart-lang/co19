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
 * generator functions
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

Stream<int> a1() async* {
  yield 1;
}

Stream a2() async* {
  yield 1;
}

Stream a3() async* {
  yield 2;
}

Stream<String> b1(int x) async* {
  yield 'a' + new String.fromCharCode(x);
}

Stream b2(String s) async* {
  yield s.length;
}

Stream b3(z) async* {
  yield z;
}

main() {
  asyncStart();
  Future.wait([
    a1().first, a2().first, a3().first,
    b1(70).first, b2('hello').first, b3(b3).first
  ]).then(
      (_) {
        asyncEnd();
      }
  );
}
