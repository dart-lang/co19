// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation doesn't have the
/// same kind as the introductory declaration. For example, augmenting a `class`
/// with a `mixin`, an `enum` with a function, a method with a getter, etc.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and the corresponding type are not the same kind.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part 'augmenting_types_A01_t01_lib1.dart';
part 'augmenting_types_A01_t01_lib2.dart';
part 'augmenting_types_A01_t01_lib3.dart';
part 'augmenting_types_A01_t01_lib4.dart';
part 'augmenting_types_A01_t01_lib5.dart';

class C {}

mixin M {}

enum E {e1;}

extension Ext on C {}

extension type ET(int _) {}

typedef void F();

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
  print(F);
}
