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

class C<T1 extends num, T2> {
  T1 t1;
  T2 t2;
  C(this.t1, this.t2);
}

@meta typedef CAlias1 = C;
@meta typedef CAlias2<T extends num> = C<T, String>;
typedef CAlias3 = C<int, String>;

main() {
  CAlias1 ca1 = new CAlias1(3.14, "3.14");
  Expect.isTrue(ca1 is C<num, dynamic>);
  Expect.isTrue(ca1.t1 is num);
  Expect.isTrue(ca1.t2 is dynamic);
  Expect.runtimeIsType<C<num, dynamic>>(ca1);
  Expect.runtimeIsType<num>(ca1.t1);
  Expect.runtimeIsType<dynamic>(ca1.t2);
  ca1.t1 = 42;
  Expect.equals(42, ca1.t1);

  CAlias2<int> ca2 = new CAlias2<int>(42, "");
  Expect.isTrue(ca2 is C<int, String>);
  Expect.isTrue(ca2.t1 is int);
  Expect.isTrue(ca2.t2 is String);
  Expect.runtimeIsType<C<int, String>>(ca2);
  Expect.runtimeIsType<int>(ca2.t1);
  Expect.runtimeIsType<String>(ca2.t2);
  ca2.t1 = -1;
  Expect.equals(-1, ca2.t1);
  ca2.t2 = "Lily was here";
  Expect.equals("Lily was here", ca2.t2);

  CAlias3 ca3 = new CAlias3(42, "");
  Expect.isTrue(ca3 is C<int, String>);
  Expect.isTrue(ca3.t1 is int);
  Expect.isTrue(ca3.t2 is String);
  Expect.runtimeIsType<C<int, String>>(ca3);
  Expect.runtimeIsType<int>(ca3.t1);
  Expect.runtimeIsType<String>(ca3.t2);
  ca3.t1 = -1;
  Expect.equals(-1, ca3.t1);
  ca3.t2 = "Lily was here";
  Expect.equals("Lily was here", ca3.t2);
}
