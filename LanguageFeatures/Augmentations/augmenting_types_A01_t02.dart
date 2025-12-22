// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation doesn't have the
/// same kind as the introductory declaration. For example, augmenting a `class`
/// with a `mixin`, an `enum` with a function, a method with a getter, etc.
///
/// @description Checks that it is a compile-time error if an augmented
/// declaration is a type alias and an augmenting declaration is not
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part 'augmenting_types_A01_t02_lib1.dart';
part 'augmenting_types_A01_t02_lib2.dart';
part 'augmenting_types_A01_t02_lib3.dart';
part 'augmenting_types_A01_t02_lib4.dart';

class C {}

mixin M {}

enum E {e1;}

extension type ET(int _) {}

typedef CAlias = C;
typedef MAlias = M;
typedef EAlias = E;
typedef ETAlias = ET;

main() {
  print(CAlias);
  print(MAlias);
  print(EAlias);
  print(ETAlias);
}
