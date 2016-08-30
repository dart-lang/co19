/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to mutate a constant list literal will result in a
 * dynamic error.
 * @description Checks that it is a run-time error to attempt to modify
 * a constant list literal.
 * @author msyabro
 * @needsreview Issue 1553
 * @reviewer kaigorodov
 */

main() {
    (const []).add(1); /// 01: runtime error
    (const [1, 2, 3])[0] = 5; /// 02: runtime error
    (const [true, false]).removeLast(); /// 03: runtime error
    (const [""]).clear(); /// 04: runtime error
    (const []).clear(); /// 05: runtime error
    (const []).add(1); /// 06: runtime error
}
