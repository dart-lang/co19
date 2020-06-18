/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the value of a compile-time
 * constant expression depends on itself.
 * @description Checks that it is a compile-time error if there is a circular
 * reference in a constant variable's initialization.
 * @author iefremov
 */

const a1 = a10; //# 01: compile-time error
const a2 = a1;  //# 01: continued
const a3 = a2;  //# 01: continued
const a4 = a3;  //# 01: continued
const a5 = a4;  //# 01: continued
const a6 = a5;  //# 01: continued
const a7 = a6;  //# 01: continued
const a8 = a7;  //# 01: continued
const a9 = a8;  //#01: continued
const a10 = a9; //# 01: continued

main() {
}
