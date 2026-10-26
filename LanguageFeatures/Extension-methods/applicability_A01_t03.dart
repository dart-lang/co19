// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension `E` is applicable to a simple or composite member
/// invocation with corresponding member basename m and target expression `e`,
/// where `e` has static type `S`, if
/// ...
/// - The type S does not have an instance member with the basename m. For this,
///   the type `dynamic` is considered as having all member names, and an
///   expression of type `Never` or `void` cannot occur as the target of a
///   member invocation, so none of these can ever have applicable extensions.
///   Function types and the type `Function` are considered as having a `call`
///   member. This ensure that if there is an applicable extension, the existing
///   invocation would otherwise be a compile-time error. Members of `Object`
///   exists on all types, so they can never be the target of implicit member
///   invocations (they can also not be declared as extension members).
///
/// @description Check that if an applicable extension declares only a setter
/// with the basename `m`, then it is a compile-time error to invoke `m` as a
/// method or to read it as a getter. Test function types, the type `Function`
/// and an interface type.
/// @author sgrekhov22@gmail.com
/// @issue 64532

class C {}

extension Ext<X> on X {
  set foo(int _) {}
}

test(void Function() f1, void Function(Null) f2, Function f3, C c) {
  f1.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  f2.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  f3.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  c.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  f1.foo;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  f2.foo;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  f3.foo;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  c.foo;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
