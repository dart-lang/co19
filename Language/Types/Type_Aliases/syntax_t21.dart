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
 * built-in types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

import "dart:async";
import "../../../Utils/expect.dart";

const int meta = 1;

@meta typedef AFuture1 = Future;
@meta typedef AFuture2<X> = Future<X>;

@meta typedef AFutureOr1 = FutureOr;
@meta typedef AFutureOr2<X> = FutureOr<X>;

main() {
  AFuture1 af1 = new Future.value("Lily was here");
  Expect.isTrue(af1 is Future<dynamic>);

  AFuture2<String> af2 = new Future<String>.value("Lily was here");
  Expect.isTrue(af2 is Future<String>);

  AFutureOr1 afr1 = new Future.value("Lily was here");
  Expect.isTrue(afr1 is Future<dynamic>);

  AFutureOr1 afr11 = "Lily was here";
  Expect.isTrue(afr11 is dynamic);

  AFutureOr2<String> afr2 = new Future<String>.value("Lily was here");
  Expect.isTrue(afr2 is Future<String>);

  AFutureOr2<String> afr22 = "Lily was here";
  Expect.isTrue(afr22 is String);
}
