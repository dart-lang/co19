// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that it is a compile error if type alias is wrongly
/// placed
/// @author sgrekhov@unipro.ru

const int meta = 1;

class A {}

class C {
  static void s() {
    typedef Alias1 = A;
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void m() {
    typedef Alias2 = A;
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test() {
  @meta typedef Alias3 = A;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  @meta typedef Alias4 = A;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
