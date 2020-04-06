/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For the purposes of extension method resolution, there is no
 * special treatment of nullable types with respect to what members are
 * considered accessible. That is, the only members of a nullable type that are
 * considered accessible (and hence which take precedence over extensions) are
 * the members on Object.
 *
 * @description Check that extension method resolution is applicable to the
 * nullable type. Test type alias for A?
 * @author sgrekhov@unipro.ru
 * @issue 41349
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

import "../../../Utils/expect.dart";

typedef IntAlias = int?;

extension on IntAlias {
  bool get isEven => this?.isEven ?? true;
}

void main() {
  IntAlias i = null;
  Expect.isTrue(i.isEven);
}
