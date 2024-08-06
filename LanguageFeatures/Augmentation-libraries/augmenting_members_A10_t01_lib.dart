// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `external` declaration is augmented with an abstract declaration. For
/// variables this also applies to the implicit getter and setter.
///
/// @description Checks that that it is a compile-time error if an `external`
/// declaration is augmented with an abstract declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A10_t01.dart';

augment abstract class C1 {
  augment void externalMethod();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C2 {
  augment int get externalGetter;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C3 {
  augment void set externalSetter(int _);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
