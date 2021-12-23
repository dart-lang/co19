// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that type alias syntax works as expected. Test
/// non-function type alias with type parameters
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class A {}
class B extends A {}
class D extends B {}

class C<T extends A> {
  T t;
  C(this.t);
}

typedef CAlias<T extends B> = C<T>;

main() {
  CAlias<D> ca = new CAlias<D>(new D());
  Expect.isTrue(ca is C<D>);
  Expect.isTrue(ca.t is D);
  Expect.runtimeIsType<C<D>>(ca);
  Expect.runtimeIsType<D>(ca.t);
}
