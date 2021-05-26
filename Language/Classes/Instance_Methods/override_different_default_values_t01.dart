// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a static warning if an instance method m1 overrides an 
/// instance member m2, the signature of m2 explicitly specifies a default 
/// value for a formal parameter p and the signature of m1 specifies a different 
/// default value for p.
/// @description Checks that it is a static warning if overridden and overriding
/// methods have different default values for their optional parameter.
/// @issue 27476
/// @author msyabro


class A {
  foo([x = '']) {}
}

class C extends A {
  foo([x = 1]) {
//     ^^^^^
// [analyzer] STATIC_WARNING.INVALID_OVERRIDE_DIFFERENT_DEFAULT_VALUES_POSITIONAL
  }
}

main() {
  new A().foo(2);
  new C().foo(1);
}
