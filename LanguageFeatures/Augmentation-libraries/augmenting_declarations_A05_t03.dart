// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Because of augmentations, non-abstract class, mixin, mixin class,
/// enum, extension type, and extension declarations are now allowed to contain
/// abstract member declarations, as long as those members are equipped with a
/// body by an augmentation declaration.
///
/// @description Checks that it is still a compile-time error if a body of an
/// abstract member of a non-abstract class is not provided by an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_declarations_A05_t03_lib.dart';

class C {
  String abstractMethod();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String get abstractGetter;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set abstractSetter(String v);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  String abstractMethod();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String get abstractGetter;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set abstractSetter(String v);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  String abstractMethod();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String get abstractGetter;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set abstractSetter(String v);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(String _) {
  String abstractMethod();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String get abstractGetter;
//^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set abstractSetter(String v);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(A);
  print(ET);
}
