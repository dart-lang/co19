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
 * @description Check that if legacy class implements opted-in class, legacy
 * getter cannot return anything but [null] if corresponding parent getter is of
 * the type [Never].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "dart:async";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A1 implements OPTED_NEVER_GETTER {
  int get getNever => 1;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A2 implements OPTED_NEVER_GETTER {
  dynamic get getNever => 1;
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A3 implements OPTED_NEVER_GETTER {
  FutureOr get getNever => 1;
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A4 implements OPTED_NEVER_GETTER {
  Function get getNever => testme1;
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A5 implements OPTED_NEVER_GETTER {
  Object get getNever => testme1;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A1();
  A2();
  A3();
  A4();
  A5();
}
