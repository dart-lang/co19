// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class implements opted-in class, legacy
/// method can accept [Null] argument if corresponding parent method argument is
/// of [Never] type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A implements OPTED_NEVER_ARGS {
  void test_never(Null i) { Expect.isNull(i); }
}

main() {
  A a = A();
  a.test_never(null);
}
