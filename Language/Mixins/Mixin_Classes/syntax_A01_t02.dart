// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ⟨mixinApplicationClass⟩ ::=
///     ⟨identifier⟩ ⟨typeParameters⟩? ‘=’ ⟨mixinApplication⟩ ‘;’
/// ⟨mixinApplication⟩ ::= ⟨typeNotVoid⟩ ⟨mixins⟩ ⟨interfaces⟩?
///
/// It is a compile-time error if an element in the type list of the with clause
/// of a mixin application is a type variable, a function type, a type alias
/// that does not denote a class, an enumerated type, a deferred type, type
/// dynamic, type void, or type FutureOr<T> for any T
///
/// @description Checks that it is a compile-time error if any of `mixins` is
/// not a type
/// @author sgrekhov@unipro.ru

class S {
}

mixin class M1 {
}

var M2;

class C = S with M1, M2;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
