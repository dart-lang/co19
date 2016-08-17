/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to mutate a constant map literal will result in
 * a dynamic error.
 * @description Checks that it is a run-time error to attempt to modify a
 * constant map literal.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
    (const {})["1"] = 2; /// 01: runtime error
    (const {"k1": 1}).remove("k1"); /// 02: runtime error
    (const {"k1": 1})["k1"] = 0; /// 03: runtime error
    (const {"k1" : 1, "k2": false}).clear(); /// 04: runtime error
    (const {}).clear(); /// 05: runtime error
}
