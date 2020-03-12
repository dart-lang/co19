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
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../../Utils/expect.dart";
import "../opted_in_lib.dart";

typedef AAlias = A;
typedef StringAlias = String;
typedef IntAlias = int;

main() {
  AAlias a1 = null;
  StringAlias s1 = null;
  IntAlias i1 = null;

  a1 = new A();
  s1 = "Lily was here";
  i1 = 42;

  Expect.isTrue(a1 is A);
  Expect.isTrue(s1 is String);
  Expect.isTrue(i1 is int);
}
