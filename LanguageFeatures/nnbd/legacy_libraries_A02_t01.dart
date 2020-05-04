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
 * @description Check that all required named parameters are treated as optional
 * named parameters.
 * @author sgrekhov@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "opted_in_lib.dart";

main() {
  A.bar();
  test();
  new A().test();

  A.bar(named: "Lily");
  test(named: "was");
  new A().test(named: "here");
}
