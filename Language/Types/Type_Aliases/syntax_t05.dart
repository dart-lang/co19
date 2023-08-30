// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that it is a compile error if type alias has wrong number
/// of type parameters
/// @author sgrekhov@unipro.ru

class A {}
class C<T1, T2> {}

typedef Alias1<T> = A<T>;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef Alias2 = A<int>;
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef Alias3<T> = C<T>;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef Alias4<T1, T2, T3> = C<T1, T2, T3>;
//                           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef Alias5<T1, T2, T3> = C<T3>;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef Alias6<T1, T2> = C<T1, T2, String>;
//                       ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
