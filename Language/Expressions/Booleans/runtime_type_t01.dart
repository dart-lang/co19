/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking the getter runtimeType on a boolean literal returns the
 * Type object that is the value of the expression bool.
 * @description Checks that invoking the getter runtimeType on a boolean
 * literal returns the Type object that is the value of the expression bool.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

main() {
  Expect.isTrue(true.runtimeType is Type);
  Expect.isTrue(true.runtimeType == bool);
  Expect.isTrue(false.runtimeType is Type);
  Expect.isTrue(false.runtimeType == bool);
}
