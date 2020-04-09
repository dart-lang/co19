/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if function with required argument is exported
 * from opted-in library to legacy library and then back to the opted in code,
 * it retains its status, i.e. its parameter cannot be unspecified in the
 * function call.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "exports_A01_opted_out_lib.dart";

main() {
  test_required_arg();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  test_required_arg(i: null);
//                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
