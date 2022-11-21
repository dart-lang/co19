// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable is a variable whose binding is fixed upon
/// initialization; a final variable v will always refer to the same object
/// after v has been initialized. The declaration of a final variable must
/// include the modifier final.
/// It is a static warning if a final instance variable that has been
/// initialized at its point of declaration is also initialized in a
/// constructor.
/// It is a compile-time error if a local variable v is final and v is not
/// initialized at its point of declaration.
/// @description Checks that it is a compile error to initialize final instance
/// variable both in initializing formal and initializer list
/// (Classes/Constructors/Generative Constructors)
/// @author rodionov


class C {
  final v;
  
  C(this.v) : v = 1 {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
    new C(1);
}
