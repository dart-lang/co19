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
 * @description Check that if legacy class extends legacy class and implements
 * opted-in class, legacy getter can return [null] if corresponding parent
 * getter is of the type [Never].
 *
 * @Issue 40389
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A extends B implements OPTED_NEVER_GETTER {}

class B {
  Null get getNever => null;
}

main() {
  A a = A();
  Expect.isNull(a.getNever);
}
