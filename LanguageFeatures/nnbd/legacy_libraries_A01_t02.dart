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
  Expect.isTrue(aVar2 is A);
  Expect.isTrue(cVar2 is C<A>);
  Expect.isTrue(sVar2 is String);
  Expect.isTrue(iVar2 is int);
  aVar2 = null;
  cVar2 = null;
  sVar2 = null;
  iVar2 = null;
}
