/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class is a mixin with legacy class and
 * child type parameter is non-nullable, child opted-in class type parameter
 * cannot be [Null].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class D1<X extends A> with D<X> {}

main() {
  D1<Null>();
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
