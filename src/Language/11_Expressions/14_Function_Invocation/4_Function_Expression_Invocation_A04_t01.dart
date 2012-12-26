/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If F is not a function type, the static type of i is Dynamic.
 * Otherwise:
 *    the static type of i is the declared return type of F.
 *    Let Ti be the static type of ai, i from 1 to n + k. It is a static warning if F is
 * not a supertype of (T1, ... , Tn, [Tn+1 xn+1, ... , Tn+k xn+k]) -> ⊥.
 * @description Checks that the static type of i is the declared return type of F when F is a function type
 * by verifying that the result of such function invocation expression can be assigned to a variable
 * of the same type without static warnings.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class C {}

main() {
  int resultInt = () {}();
  bool resultBool = () {}();
  String resultString = () {}();
  C resultC = () {}();
}
