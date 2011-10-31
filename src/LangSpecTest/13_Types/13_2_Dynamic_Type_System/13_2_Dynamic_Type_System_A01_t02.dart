/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A Dart implementation must support execution in both production mode and checked mode.
 * Those dynamic checks specified as occurring specifically in checked mode must be performed if
 * the code is executed in checked mode.
 * @description Checks that a dynamic type error occurs in checked mode when a variable is being
 * assigned an expression of incompatible type. (see 10.16)
 * @dynamic-type-error
 * @author rodionov
 * @needsreview TODO: Need checked mode support.
 */

main() {
  String v = 1;
}

