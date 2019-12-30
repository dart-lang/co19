/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All opted-in libraries upstream from the legacy library are
 * viewed by the legacy library with nullability related features erased from
 * their APIs. In particular:
 *  - All types of the form T? in the opted-in API are treated as T.
 *  - All required named parameters are treated as optional named parameters.
 *  - The type Never is treated as the type Null
 *
 * @description Check that all types of the form T? in the opted-in API are
 * treated as T
 * @author sgrekhov@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";
import "opted_in_lib.dart";

main() {
  Expect.isNull(aVar1);
  Expect.isNull(cVar1);
  Expect.isNull(sVar1);
  Expect.isNull(iVar1);

  aVar1 = new A();
  Expect.isTrue(aVar1 is A);
  aVar1 = null;

  cVar1 = new C<A>(aVar1);
  Expect.isTrue(cVar1 is C<A>);
  cVar1 = null;

  sVar1 = "Lily was here";
  Expect.isTrue(sVar1 is String);
  sVar1 = null;

  iVar1 = 42;
  Expect.isTrue(iVar1 is int);
  iVar1 = null;

  A a = null;
  C<A> c = null;
}
