/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Typedef grammar:
 * functionTypeAlias:
 *   typedef functionPrefix typeParameters? formalParameterList ’;’
 * ;
 * functionPrefix:
 *   returnType? identifier
 * ;
 * @description Checks that different variants of this statement work and do not cause any
 * errors.
 * @author rodionov
 * @reviewer iefremov
 */

typedef _foo();
typedef int _bar<A, B>(A a, [B b]);
typedef List<List> _baz<A extends Function, B extends num>(A a, [B i]);

main() {
  _foo foo = () {return;};
  _bar bar = (int a, [bool b]) {return 0;};
  _bar akbar = (int a, [bool b]) => 0;
  _baz baz = (_bar b, [int i]) {};
}

