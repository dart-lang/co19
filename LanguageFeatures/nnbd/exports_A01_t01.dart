/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that opted-in library exported to legacy and then back to
 * opted in is still opted-in library.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "exports_legacy_A01_lib.dart";

main() {
  A? a1 = new A();
  A? a2 = null;

  A a3 = new A();
  A a4 = null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
