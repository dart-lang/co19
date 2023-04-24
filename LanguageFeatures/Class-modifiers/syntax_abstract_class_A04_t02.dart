// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Check that it is a compile-time error to mix in an
/// `abstract class` in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract class AbstractClass {}

class ClassWithAbstractClass1 with AbstractClass {}
//                                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithAbstractClass2 = Object with AbstractClass;
//                                          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractClass1 with AbstractClass {}
//                                          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractClass2 = Object with AbstractClass;
//                                                   ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithAbstractClass1 with AbstractClass {}
//                                                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithAbstractClass2 = Object with AbstractClass;
//                                                             ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractClass1 with AbstractClass {}
//                                            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractClass2 = Object with AbstractClass;
//                                                     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractClass1 with AbstractClass {}
//                                              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractClass2 = Object with AbstractClass;
//                                                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithAbstractClass1 with AbstractClass {}
//                                                  ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithAbstractClass2 = Object with AbstractClass;
//                                                           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractClass1 with AbstractClass {}
//                                                           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractClass2 = Object with AbstractClass;
//                                                                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithAbstractClass1 with AbstractClass {}
//                                                                     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithAbstractClass2 = Object with AbstractClass;
//                                                                              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractClass1 with AbstractClass {}
//                                                             ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractClass2 = Object with AbstractClass;
//                                                                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractClass with AbstractClass {e1, e2}
//                              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithAbstractClass1);
  print(ClassWithAbstractClass2);
  print(BaseClassWithAbstractClass1);
  print(BaseClassWithAbstractClass2);
  print(InterfaceClassWithAbstractClass1);
  print(InterfaceClassWithAbstractClass2);
  print(FinalClassWithAbstractClass1);
  print(FinalClassWithAbstractClass2);
  print(SealedClassWithAbstractClass1);
  print(SealedClassWithAbstractClass2);
  print(AbstractClassWithAbstractClass1);
  print(AbstractClassWithAbstractClass2);
  print(AbstractBaseClassWithAbstractClass1);
  print(AbstractBaseClassWithAbstractClass2);
  print(AbstractInterfaceClassWithAbstractClass1);
  print(AbstractInterfaceClassWithAbstractClass2);
  print(AbstractFinalClassWithAbstractClass1);
  print(AbstractFinalClassWithAbstractClass2);
  print(EnumWithAbstractClass);
}
