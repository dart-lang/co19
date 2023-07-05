// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ⟨mixinApplicationClass⟩ ::=
///     ⟨identifier⟩ ⟨typeParameters⟩? ‘=’ ⟨mixinApplication⟩ ‘;’
/// ⟨mixinApplication⟩ ::= ⟨typeNotVoid⟩ ⟨mixins⟩ ⟨interfaces⟩?
///
/// @description  Checks that it is a compile-time error if a class extends a
/// mixin application where the superclass is a type alias and the mixin is a
/// non-type.
/// @author sgrekhov@unipro.ru

class S {
}

typedef SAlias = S;

var M;

class C extends SAlias with M {
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
