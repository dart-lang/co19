/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  In a legacy library, none of the new syntax introduced by this
 * proposal is available, and it is a static error if it is used.
 *
 * @description Check that it is a static error if NNBD syntax is used in a
 * pre-NNBD legacy library
 * @author sgrekhov@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable

class C {
  static late final String s1;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static late String s2;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  covariant late String v1;
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  late final String v2;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  late String v3;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

  late final String g1;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  late String g2;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  late final String l1;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  late String l2;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
