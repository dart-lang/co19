/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Implemented via === operator.
 * @description Checks that the method returns true for references to the same
 *              canonicalized Object and false for non-constant Objects.
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview undocumented
 */

main()
{
  Expect.isTrue(const Object() == const Object());
  Expect.isTrue(const Object() == const Object().dynamic);

  Expect.isFalse(new Object() == new Object());
  Expect.isFalse(const Object() == new Object());
  Expect.isFalse(new Object() == const Object());
}
