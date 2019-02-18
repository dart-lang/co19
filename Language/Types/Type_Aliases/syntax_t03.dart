/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type alias declares a name for a type expression.
 * <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
 * ‘;’
 * | <metadata> typedef <functionTypeAlias>
 *  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
 *  <functionPrefix> ::= <type>? <identifier>
 * @description Checks that type alias syntax works as expected. Test
 * non-function type alias with type parameters
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C<T extends num> {
  T t;
}

typedef CAlias1 = C;
typedef CAlias2<T extends num> = C<T>;

main() {
  CAlias1 ca1 = new CAlias1();
  Expect.isTrue(ca1 is C<dynamic>);
  Expect.isTrue(ca1.t is dynamic);
  ca1.t = "Lily was here";
  Expect.equals("Lily was here", ca1.t);

  CAlias2<int> ca2 = new CAlias2<int>();
  Expect.isTrue(ca2 is C<int>);
  Expect.isTrue(ca2.t is int);
  ca2.t = -1;
  Expect.equals(-1, ca2.t);
}
