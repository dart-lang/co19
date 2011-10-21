/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface Duration extends Comparable
 * @description Checks that a Duration instance really is Comparable
 * @author rodionov
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Duration(1, 1, 1, 1, 1) is Comparable);
}
