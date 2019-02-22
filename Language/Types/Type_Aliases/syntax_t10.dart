/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type alias declares a name for a type expression.
 * <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
 * ‘;’
 * | <metadata> typedef <functionTypeAlias>
 *  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
 *  <functionPrefix> ::= <type>? <identifier>
 * @description Checks that different variants of this statement work and do
 * not cause any errors.
 * @author rodionov
 */

const int meta = 1;

@meta typedef _Foo();
typedef int _Bar<A, B>(A a, [B b]);
@meta typedef List<List> _Baz<A extends Function, B extends num>(A a, [B i]);

main() {
  _Foo foo = () {return;};
  _Bar<int, bool> bar = (int a, [bool b]) {return 0;};
  _Bar<int, bool> akbar = (int a, [bool b]) => 0;
}
