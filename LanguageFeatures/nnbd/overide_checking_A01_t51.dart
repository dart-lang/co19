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
 * @description Check that when choosing the most specific method signature
 * during interface computation, [Never] method return value is treated as
 * [Null] in legacy library.
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "override_checking_opted_in_lib.dart";

class A1 with A {
  int test_return_never() => null;
//    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A2 with A {
  int test_return_never() => 0;
//    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}
