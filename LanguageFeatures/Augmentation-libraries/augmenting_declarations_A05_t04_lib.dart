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
/// Test static members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of  'augmenting_declarations_A05_t04.dart';

augment class C {}

augment mixin M {}

augment enum E {
  e1;
}

augment extension Ext {}

augment extension type ET {}
