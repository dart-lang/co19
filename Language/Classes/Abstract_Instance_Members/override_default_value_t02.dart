/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a static warning if an instance method m1 overrides an instance member
 * m2, the signature of m2 explicitly specifies a default value for a formal
 * parameter p and the signature of m1 specifies a different default value for
 * p.
 * @description Checks that it is a static warning if an abstract method
 * overrides an instance method and does not explicitly specify a default value
 * for its optional parameter while the instance method does.
 *
 * See https://github.com/dart-lang/sdk/issues/34437#issuecomment-432093691
 *
 * @issue 27476
 * @static-warning
 * @author msyabro
 */

class A {
  foo([x = 1]) {}
}

class C extends A {
  foo([x]); /// static type warning
}

main() {
  new C().foo(1);
}
