/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns "true" if the receiver is true, or "false" if the receiver is false.
 * @description Checks that this method returns correct value.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.stringEquals("true", true.toString());
}
