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
/// @description Checks that augmentation declaration is applied after any
/// augmentation declarations that are before it, and before augmentation
/// declarations that it is before.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_declarations_A03_t01.dart';
part 'augmenting_declarations_A03_t01_lib2.dart';

augment class A {
  String foo() => "Augmented A";
}
class B {}
