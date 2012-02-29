/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If S.m does not exist, or if F is not a function type, the static type of i is Dynamic;
 * otherwise:
 *  the static type of i is the declared return type of F.
 *  Let Ti be the static type of ai, i from 1 to n + k. It is a static warning if F is
 * not a supertype of (T1, ... , Tn; [Tn+1 xn+1, ... , Tn+k xn+k]) -> ⊥.
 * @description Checks that it is a static type warning if F is not a supertype of
 * (T1, ... , Tn, [Tn+1 xn+1, ... , Tn+k xn+k]) -> ⊥.
 * @static-warning
 * @author msyabro
 */

class S {
  int m(int x, double y, [String s, bool b]) {}
}

class A extends S {
  test() {
   try {
     super.m("", "", "", "");
    } catch(TypeError e) {}
  }
}

main() {
  new A().test();
}
