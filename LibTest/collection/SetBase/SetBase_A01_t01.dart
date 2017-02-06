/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SetBase()
 * Base implementation of [Set].
 * @description Checks that default constructor returns a empty set.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "SetBase.lib.dart";
import "../../../Utils/expect.dart";

main() {
  SetBase base = new SetBaseImpl();
  Expect.isTrue(base.isEmpty);
}
