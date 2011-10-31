/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A Dart implementation must support execution in both production mode and checked mode.
 * Those dynamic checks specified as occurring specifically in checked mode must be performed if
 * the code is executed in checked mode.
 * @description Checks that a dynamic type error occurs in checked mode when a list element is being
 * assigned a value whose type is not a subtype of the list's element type. (see 10.6)
 * @dynamic-type-error
 * @author iefremov
 * @reviewer rodionov
 * @needsreview TODO: Need checked mode support.
 */

main() {
  <int> [1, 2, "not an int!"];
}

