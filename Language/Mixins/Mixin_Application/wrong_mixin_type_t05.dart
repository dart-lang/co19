// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ⟨mixinApplicationClass⟩ ::=
///     ⟨identifier⟩ ⟨typeParameters⟩? ‘=’ ⟨mixinApplication⟩ ‘;’
/// ⟨mixinApplication⟩ ::= ⟨typeNotVoid⟩ ⟨mixins⟩ ⟨interfaces⟩?
///
/// @description Checks that it is a compile-time error if any of `mixins` is
/// not a type
/// @author sgrekhov@unipro.ru

class S {
}

var M1;

mixin class M2 {
}

class C = S with M1, M2;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
