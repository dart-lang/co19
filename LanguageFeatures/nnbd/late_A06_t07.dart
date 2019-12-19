/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A write to a field or variable which is marked final and late is a
 * runtime error unless the field or variable was declared with no initializer
 * expression, and there have been no previous writes to the field or variable
 * (including via an initializing formal or an initializer list entry).
 *
 * @description Check that a write to a field or variable which is marked final
 * and late is a runtime error. Test the case when field has an initializer
 * expression
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  late final String v1 = "Lily was here";
  late final String? v2 = "Lily was here";
}

main() {
  dynamic c = new C();
  Expect.throws(() {c.v1 = "Let it be";});
  Expect.throws(() {c.v2 = "Let it be";});
}
