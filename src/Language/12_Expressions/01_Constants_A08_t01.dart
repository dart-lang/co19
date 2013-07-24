/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant list literal is a constant expression.
 * @description Checks that a constant list literal can be an element of
 * a constant list literal and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

final constList = const [const ["hello", "world"]];

main() {
  Expect.isTrue(constList is List);
}
