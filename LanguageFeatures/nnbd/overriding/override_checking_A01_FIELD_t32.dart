/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
 * @description Check that if legacy class extends legacy class and implements
 * opted-in class, child legacy field cannot be of any type but [Null] if parent
 * field is [Never].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "override_checking_A01_opted_in_lib.dart";

class B1 { int n; }
class A1 extends B1 implements OPTED_NEVER_FIELD {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class B2 { dynamic n; }
class A2 extends B2 implements OPTED_NEVER_FIELD {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B3 { Object n; }
class A3 extends B3 implements OPTED_NEVER_FIELD {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B4 { void n; }
class A4 extends B4 implements OPTED_NEVER_FIELD {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A1();
  A2();
  A3();
  A4();
}
