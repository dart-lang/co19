/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 *
 * The default behavior for all Objects is to return true if and only if this
 * and other are the same object.
 * @description Checks that the method returns true for references to the same
 * canonicalized Object and false for non-constant Objects.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(const Object() == const Object());
  Expect.isTrue(const Object() == (const Object() as dynamic));

  Expect.isFalse(new Object() == new Object());
  Expect.isFalse(const Object() == new Object());
  Expect.isFalse(new Object() == const Object());
}
