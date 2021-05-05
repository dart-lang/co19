// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
/// apply to abstract methods.
/// It is a compile error if an instance method m1 overrides an instance member
/// m2 and m1 has fewer positional parameters than m2.
/// @description Checks that it is a compile error if an instance method m1
/// overrides an abstract instance member m2 and m1 has fewer positional
/// parameters than m2.
/// @compile-error
/// @author iefremov


abstract class A {
  foo(var a, [x, y]);
}

class C extends A {
  foo(var a, [x]) {}
}

main() {
  new C().foo(1);
}
