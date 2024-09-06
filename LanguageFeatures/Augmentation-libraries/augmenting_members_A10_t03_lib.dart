// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `external` declaration is augmented with an abstract declaration. For
/// variables this also applies to the implicit getter and setter.
///
/// @description Checks that that it is not an error if an `external`
/// member is augmented with an abstract one.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A10_t03.dart';

augment abstract class C1 {
  augment void externalMethod();
}

augment abstract class C2 {
  augment int get externalGetter;
}

augment abstract class C3 {
  augment void set externalSetter(int _);
}
