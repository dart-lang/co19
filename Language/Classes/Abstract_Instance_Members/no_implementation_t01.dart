// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An abstract method (respectively, abstract getter or abstract
/// setter) is an instance method, getter or setter that is not declared
/// external and does not provide an implementation.
/// @description Checks that instance method, getter or setter can not be
/// declared without providing an implementation.
/// @author kaigorodov


class C {
//    ^
// [cfe] The non-abstract class 'C' is missing implementations for these members:
  void m();
//^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.CONCRETE_CLASS_WITH_ABSTRACT_MEMBER
  int get g;
//^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.CONCRETE_CLASS_WITH_ABSTRACT_MEMBER
  set g(int v);
//^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.CONCRETE_CLASS_WITH_ABSTRACT_MEMBER
}

main() {
  new C();
}
