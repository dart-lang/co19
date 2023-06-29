// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin declaration introduces a mixin and provides a scope for
/// static member declarations.
/// ⟨mixinDeclaration⟩ ::= mixin ⟨typeIdentifier⟩ ⟨typeParameters⟩?
///     (on ⟨typeNotVoidList⟩)? ⟨interfaces⟩?
///     ‘{’ (⟨metadata⟩ ⟨classMemberDeclaration⟩)* ‘}’
/// ...
/// A mixin declaration with no on clause is equivalent to one with the clause
/// on Object.
///
/// @description Checks that it is no compile error to declare mixin on a class
/// which has a superclass other than `Object`.
/// @issue 26409
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

class A {
  String a() => "A";
}

class S extends A {
}

mixin M on A {
  String m() {
    return super.a();
  }
}

class C = S with M;

main() {
  C c = new C();
  Expect.equals("A", c.m());
}
