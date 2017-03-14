/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type runtimeType
 * A representation of the runtime type of the object.
 * @description Checks that runtimeType is not null
 * @author a.semenov@unipro.ru
 */
library runtimeType_A02_t01;
import "../../../Utils/expect.dart";

test(Object create()) {
  Expect.isNotNull(create().runtimeType);
}
