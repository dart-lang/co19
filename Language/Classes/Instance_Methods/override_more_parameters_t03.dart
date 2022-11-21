// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static warning if an instance method m1 overrides an
/// instance member m2 and m1 has a greater number of required parameters than 
/// m2.
/// @description Checks that a compile error is produced if m2 has no parameters
/// and m1 has a single required parameter. Test type aliases
/// @author sgrekhov@unipro.ru

class A {
  f() { }
}
typedef AAlias = A;

class C extends AAlias {
  f(var x) { }
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new A().f();
  new C().f(1);
}
