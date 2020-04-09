/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic function with non-nullable type parameter
 * is exported from opted-in library to legacy library and then back to the
 * opted in code, it retains its status and so cannot accept [Null] as a type
 * parameter.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "exports_A01_opted_out_lib.dart";

main() {
  testGenericInt<Null>();
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  testGenericFunction<Null>();
//                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  testGenericObject<Null>();
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
