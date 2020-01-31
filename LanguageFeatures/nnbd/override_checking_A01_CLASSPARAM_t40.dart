/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In an unmigrated library, override checking is done using legacy
 * types. This means that an unmigrated library can bring together otherwise
 * incompatible methods. When choosing the most specific signature during
 * interface computation, all nullability and requiredness annotations are
 * ignored, and the [Never] type is treated as [Null].
 *
 * @description Check that if generic legacy class extends legacy class and
 * implements opted-in class, child class type parameter cannot be non-Null if
 * parent interface type parameter is [Never].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "override_checking_A01_opted_in_lib.dart";

class B1<T>{}
class A1<T> extends B1<T> implements OPTED_NEVER<T> {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

class B2<T> {}
class A2<T extends dynamic> extends B implements OPTED_NEVER<T> {}
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified

class B3<T> {}
class A3<T extends Object> extends B3<T> implements OPTED_NEVER<T> {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified

class B4<T> {}
class A4<T extends int> extends B4<T> implements OPTED_NEVER<T> {}
//                                          ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A1();
  A2();
  A3();
  A4();
}
