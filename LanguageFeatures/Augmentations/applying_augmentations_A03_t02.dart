// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `D` augments a declaration `I` with the same name and in the same
/// augmentation context as `D`. There may be multiple augmentations in the
/// augmentation context of `D`. More precisely, `I` is the declaration before
/// `D` and after every other declaration before `D`.
///
/// It's a compile-time error if there is no matching declaration `I`. In other
/// words, it's an error to have a declaration marked `augment` with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration augments a member defined in a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

mixin M {
  String method() => "Method";
  String get getter => "Getter";
  void set setter(String _) {}
  String operator +(Object? other) => "Operator";
}

class C = Object with M;

/**/augment class C {
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String method();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get getter;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set setter(String _);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String operator +(Object? other);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
