// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration D is a declaration marked with the
/// new built-in identifier `augment`, which makes D augment a declaration D1
/// with the same name and in the same context as D. D1 is determined as being
/// before D and after every other declaration with the same name and in the
/// same context which is before D (that is, D1 is the greatest declaration
/// which is smaller than D, according to the 'after' ordering). A compile-time
/// error occurs if no declaration satisfies the requirements on D1.
///
/// @description Checks that it is a compile-time error if a library contains an
/// augmentation declaration, but no non-augmentation declaration with the
/// corresponding name in the same scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

mixin class A {
  int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

class C1 extends A {}
class C2 with A {}

augment class C1 {
  augment void instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment void instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
