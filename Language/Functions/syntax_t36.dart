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
 * @description Checks different valid variants of asynchronous functions
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

// f() async => expression;
Future<String> a1() async => 'a1';

Future a2() async => 0;

Future a3() async => 1;

// f() { statements }
Future<String> b1() async {
  return 'b1';
}

Future b2() async {
  return 2;
}

Future b3() async {
  return 3;
}

// f(arg) async => expression;
Future<String> c1(int x) async => 'c' + x.toString();

Future c2(String y) async => y.length;

Future c3(z) async => z;

// f(arg) { statements }
Future<String> d1(int x) async {
  return 'd' + x.toString();
}

Future d2(String y) async {
  return y.length;
}

Future d3(z) async {
  return z;
}

main() {
  asyncStart();
  Future.wait([
    a1(), a2(), a3(),
    b1(), b2(), b3(),
    c1(10), c2('hello'), c3(c3),
    d1(15), d2('world'), d3(d3)
  ]).then((_) { asyncEnd(); } );
}
