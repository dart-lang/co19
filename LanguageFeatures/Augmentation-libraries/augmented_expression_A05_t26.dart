// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` refers to
///   the augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that it is a compile-time error if an augmenting
/// operator has a metadata named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {
  const augmented();
}

class C {
  @augmented()
  String operator +(Object? other) => "Original + $other";
}

augment class C {
  @augmented() augment String operator +(Object? other) => "Augment + $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String operator -(Object? other) => "Augment - $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  @augmented()
  String operator +(Object? other) => "Original + $other";
}

augment mixin M {
  @augmented() augment String operator +(Object? other) => "Augment + $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String operator -(Object? other) => "Augment - $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  @augmented()
  String operator +(Object? other) => "Original + $other";
}

augment enum E {
  e1;
  @augmented() augment String operator +(Object? other) => "Augment + $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String operator -(Object? other) => "Augment - $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  @augmented()
  String operator +(Object? other) => "Original + $other";
}

augment extension Ext {
  @augmented() augment String operator +(Object? other) => "Augment + $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String operator -(Object? other) => "Augment - $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  @augmented()
  String operator +(Object? other) => "Original + $other";
}

augment extension type ET {
  @augmented() augment String operator +(Object? other) => "Augment + $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String operator -(Object? other) => "Augment - $other";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
