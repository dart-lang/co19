/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T operator [](Object object)
 * Gets the value of this Expando's property on the given object. If the object hasn't been expanded, the method returns null.
 * @description Checks that this operator can be used on non-extensible core types (num, bool, String)
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isNull(new Expando("exp")["foo"]);
}
