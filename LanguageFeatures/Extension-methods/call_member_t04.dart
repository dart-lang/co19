// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any expression of the form e1(args) or e1<types>(args) where e1
/// does not denote a method, and where the static type of e1 is not a function
/// type, an interface type declaring a call method, or dynamic, will currently
/// be a compile-time error. If the static type of e1 is an interface type
/// declaring a call getter, then this stays a compile-time error. Otherwise we
/// check for extensions applying to the static type of e1 and declaring a call
/// member. If one such most specific extension exists, and it declares a call
/// extension method, then the expression is equivalent to e1.call(args) or
/// e1.call<typeS>(args). Otherwise it is still a compile-time error.
///
/// @description Check that it is a compile error if there is e1 is an interface
/// with 'call' getter
/// @author sgrekhov@unipro.ru



class A {
  String get call => "My name is A";
}

extension on int {
  String get call => "My name is int";
}

extension on num {
  String get call => "My name is num";
}


main() {
  1(10);
//^
// [analyzer] COMPILE_TIME_ERROR.INVOCATION_OF_NON_FUNCTION_EXPRESSION
// ^
// [cfe] 'call' isn't a function or method and can't be invoked.
  1("10");
//^
// [analyzer] COMPILE_TIME_ERROR.INVOCATION_OF_NON_FUNCTION_EXPRESSION
// ^
// [cfe] 'call' isn't a function or method and can't be invoked.
  1.0(10);
//^^^
// [analyzer] COMPILE_TIME_ERROR.INVOCATION_OF_NON_FUNCTION_EXPRESSION
//   ^
// [cfe] 'call' isn't a function or method and can't be invoked.
  1.0("10");
//^^^
// [analyzer] COMPILE_TIME_ERROR.INVOCATION_OF_NON_FUNCTION_EXPRESSION
//   ^
// [cfe] 'call' isn't a function or method and can't be invoked.
  A a = new A();
  a(2);
//^
// [analyzer] unspecified
// [cfe] unspecified
  a(2, "3");
//^
// [analyzer] unspecified
// [cfe] unspecified
}
