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

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_types_A01_t01_lib1.dart';
part 'augmenting_types_A01_t01_lib2.dart';
part 'augmenting_types_A01_t01_lib3.dart';
part 'augmenting_types_A01_t01_lib4.dart';
part 'augmenting_types_A01_t01_lib5.dart';

class C1 {}
class C2 {}
class C3 {}
class C4 {}
class C5 {}

mixin M1 {}
mixin M2 {}
mixin M3 {}
mixin M4 {}
mixin M5 {}

enum E1 {e0;}
enum E2 {e0;}
enum E3 {e0;}
enum E4 {e0;}
enum E5 {e0;}

class A {}
extension Ext1 on A {}
extension Ext2 on A {}
extension Ext3 on A {}
extension Ext4 on A {}
extension Ext5 on A {}

extension type ET1(int _) {}
extension type ET2(int _) {}
extension type ET3(int _) {}
extension type ET4(int _) {}
extension type ET5(int _) {}

typedef void F1();
typedef void F2();
typedef void F3();
typedef void F4();
typedef void F5();

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(F1);
  print(F2);
  print(F3);
  print(F4);
  print(F5);
}
