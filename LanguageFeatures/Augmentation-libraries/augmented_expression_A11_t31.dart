// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting non-redirecting generative constructors: Unlike other
///   functions, `augmented` has no special meaning in non-redirecting
///   generative constructors. It is still a reserved word inside the body of
///   these constructors, since they are within the scope of an augmenting
///   declaration.
///
/// @description Checks that it is a compile-time error for an augmenting
/// non-redirecting generative constructor to use a metadata named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {
  const augmented();
}

class C {
  int id;
  @augmented()
  C(this.id);
  @augmented()
  C.foo(this.id);
}

augment class C {
  @augmented() augment C(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment C.foo(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() C.bar(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  a0(0), a1.foo(1);
  final int id;
  @augmented()
  const E(this.id);
  @augmented()
  const E.foo(this.id);
}

augment enum E {
  a2.bar(2);
  @augmented() augment const E(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment const E.foo(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() const E.bar(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  @augmented()
  ET.foo(this.id);
}

augment extension type ET {
  @augmented() augment ET(int id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment ET.foo(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() ET.bar(this.id);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
