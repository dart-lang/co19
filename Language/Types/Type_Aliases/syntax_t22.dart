// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that it is a syntax error if type alias uses 'extends'
/// keyword
/// @author sgrekhov@unipro.ru

class A<T> {}
class C<T1, T2> {}

typedef Alias<T> = A<T extends num>;        //# 01: syntax error
typedef Clias<T1, T2> = C<T2 extends T1>;   //# 02: syntax error

main() {
}
