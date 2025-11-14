// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors). This declaration is treated as
/// a class, mixin class, enum, respectively extension type declaration without
/// a primary constructor which is obtained as described in the following. This
/// determines the dynamic semantics of a primary constructor.
///
/// A compile-time error occurs if the body of `D` contains a non-redirecting
/// generative constructor, unless `D` is an extension type.
///
/// @description Check that it is not an error if the body of `D` contains a
/// factory constructor. Test a mixin class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

mixin class C1() {
  factory C1.someName() => C1();
}

mixin class const C2.someName() {
  const factory C2() = C2.someName;
}

main() {
  C1();
  C2();
}
