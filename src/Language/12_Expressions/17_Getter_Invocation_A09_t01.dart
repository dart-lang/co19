/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the declared return type of S.m, if S.m exists;
 * otherwise the static type of i is dynamic.
 * @description Checks that static type of super.m is the return type of getter
 * named m in the class of super.
 * @static-clean
 * @author ilya
 */

class S {
  String m;
}

class C extends S {
  C() {
    String s = super.m;
  }
}

main() {
  new C();
}
