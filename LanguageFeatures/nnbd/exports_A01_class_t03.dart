/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic class with non-nullable type parameter in
 * opted-in library is exported to legacy library and then back to the opted in
 * code, its type parameter cannot be [Null] or any other nullable type.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "exports_A01_opted_out_lib.dart";

main() {
  GENERIC_NONNULLABLE_INT<int?>();
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  GENERIC_NONNULLABLE_INT<Null>();
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  GENERIC_NONNULLABLE_OBJECT<Object?>();
//                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  GENERIC_NONNULLABLE_OBJECT<Null>();
//                           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  GENERIC_NONNULLABLE_FUNCTION<Function?>();
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  GENERIC_NONNULLABLE_FUNCTION<Null>();
//                             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
