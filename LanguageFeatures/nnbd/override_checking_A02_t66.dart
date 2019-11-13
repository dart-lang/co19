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
 * @description Check that if opted-in class implements two classes (one is
 * legacy) and child type parameter is non-nullable, child opted-in class type
 * parameter cannot be [Null]. *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

abstract class DD1<X extends A> {}

class D1<X extends A> implements D<X>, DD1<X> {}
//                               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
