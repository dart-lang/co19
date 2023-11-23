// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// Declaring a generic enum which does not have a regular-bounded
/// instantiate-to-bounds result and that has an enum value declaration omitting
/// the type arguments and not having arguments from which type arguments can be
/// inferred. (For example enum EnumName<F extends C<F>> { foo; } would
/// introduce an implicit static const foo = EnumName(0, "foo"); declaration
/// where the constructor invocation requires a regular-bounded
/// instantiate-to-bounds result).
///
/// @description Check that it is a compile-time error to declare a generic enum
/// which does not have a regular-bounded instantiate-to-bounds result
/// @author sgrekhov@unipro.ru

typedef A<X> = X Function(X);

enum E<Y extends A<Y>> {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e1<Never>();
}

main() {
  E.e1;
}
