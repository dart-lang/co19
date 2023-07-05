// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if an element in the
/// type list of the with clause of a mixin application is a function type
/// @author sgrekhov22@gmail.com

class S {}
typedef void Foo();

class C = S with Foo;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
}
