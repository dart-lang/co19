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

const int meta = 1;

class C<T> {
  T t;
  C(this.t);
}

@meta typedef CAlias1 = C;
@meta typedef CAlias2<T> = C<T>;
typedef CAlias3 = C<String>;
typedef CAlias4<T> = C<int>;

main() {
  CAlias1 ca1 = new CAlias1(42);
  Expect.isTrue(ca1 is C<dynamic>);
  Expect.isTrue(ca1.t is dynamic);
  Expect.runtimeIsType<C<dynamic>>(ca1);
  Expect.runtimeIsType<dynamic>(ca1.t);
  ca1.t = "-1";
  Expect.equals("-1", ca1.t);

  CAlias2<int> ca2 = new CAlias2<int>(1);
  Expect.isTrue(ca2 is C<int>);
  Expect.isTrue(ca2.t is int);
  Expect.runtimeIsType<C<int>>(ca2);
  Expect.runtimeIsType<int>(ca2.t);
  ca2.t = -1;
  Expect.equals(-1, ca2.t);

  CAlias3 ca3 = new CAlias3("");
  Expect.isTrue(ca3 is C<String>);
  Expect.isTrue(ca3.t is String);
  Expect.runtimeIsType<C<String>>(ca3);
  Expect.runtimeIsType<String>(ca3.t);
  ca3.t = "Lily was here";
  Expect.equals("Lily was here", ca3.t);

  CAlias4<String> ca4 = new CAlias4<String>(1);
  Expect.isTrue(ca4 is C<int>);
  Expect.isTrue(ca4.t is int);
  Expect.runtimeIsType<C<int>>(ca4);
  Expect.runtimeIsType<int>(ca4.t);
  ca4.t = 42;
  Expect.equals(42, ca4.t);
}
