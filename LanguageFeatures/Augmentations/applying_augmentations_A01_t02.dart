// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation doesn't have the
/// same kind as the introductory declaration. For example, augmenting a `class`
/// with a `mixin`, an `enum` with a function, a method with a getter, etc.
///
/// @description Checks that it is a compile-time error if an augmented
/// declaration is a type alias and an augmenting declaration is not.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'applying_augmentations_A01_t02_lib1.dart';
part 'applying_augmentations_A01_t02_lib2.dart';
part 'applying_augmentations_A01_t02_lib3.dart';
part 'applying_augmentations_A01_t02_lib4.dart';

class C {}

mixin M {}

enum E {e0;}

extension type ET(int _) {}

typedef CAlias1 = C;
typedef CAlias2 = C;
typedef CAlias3 = C;
typedef CAlias4 = C;

typedef MAlias1 = M;
typedef MAlias2 = M;
typedef MAlias3 = M;
typedef MAlias4 = M;

typedef EAlias1 = E;
typedef EAlias2 = E;
typedef EAlias3 = E;
typedef EAlias4 = E;

typedef ETAlias1 = ET;
typedef ETAlias2 = ET;
typedef ETAlias3 = ET;
typedef ETAlias4 = ET;

main() {
  print(CAlias1);
  print(CAlias2);
  print(CAlias3);
  print(CAlias4);
  print(MAlias1);
  print(MAlias2);
  print(MAlias3);
  print(MAlias4);
  print(EAlias1);
  print(EAlias2);
  print(EAlias3);
  print(EAlias4);
  print(ETAlias1);
  print(ETAlias2);
  print(ETAlias3);
  print(ETAlias4);
}
