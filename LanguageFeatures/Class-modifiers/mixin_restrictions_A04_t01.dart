// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class or enum declaration D from
/// library L has S from library K as a declared mixin, unless:
/// - S is a mixin or mixin class declaration (necessarily from a post-feature
///   library), or
/// - S is a non-mixin class declaration which has Object as superclass and
///   declares no generative constructor, and either
///   - K is a pre-feature library, or
///   - K is a platform library and L is a pre-feature library.
///
/// @description Check that it is a compile-time error if a class declaration
/// mixes in class not declared as `mixin`. Test the case when mixed in classes
/// defined in another library
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class C1 with Class {
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 with BaseClass {
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 with InterfaceClass {
//            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 with FinalClass {
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5 with SealedClass {
//            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 with AbstractClass {
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7 with AbstractBaseClass {
//            ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8 with AbstractInterfaceClass {
//            ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C9 with AbstractFinalClass {
//            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC1 with Class {
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC2 with BaseClass {
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC3 with InterfaceClass {
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC4 with FinalClass {
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC5 with SealedClass {
//                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC6 with AbstractClass {
//                  ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC7 with AbstractBaseClass {
//                  ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC8 with AbstractInterfaceClass {
//                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base class BC9 with AbstractFinalClass {
//                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC1 with Class {
//                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC2 with BaseClass {
//                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC3 with InterfaceClass {
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC4 with FinalClass {
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC5 with SealedClass {
//                       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC6 with AbstractClass {
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC7 with AbstractBaseClass {
//                       ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC8 with AbstractInterfaceClass {
//                       ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

interface class IC9 with AbstractFinalClass {
//                       ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC1 with Class {
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC2 with BaseClass {
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC3 with InterfaceClass {
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC4 with FinalClass {
//                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC5 with SealedClass {
//                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC6 with AbstractClass {
//                   ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC7 with AbstractBaseClass {
//                   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC8 with AbstractInterfaceClass {
//                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

final class FC9 with AbstractFinalClass {
//                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC1 with Class {
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC2 with BaseClass {
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC3 with InterfaceClass {
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC4 with FinalClass {
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC5 with SealedClass {
//                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC6 with AbstractClass {
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC7 with AbstractBaseClass {
//                    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC8 with AbstractInterfaceClass {
//                    ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

sealed class SC9 with AbstractFinalClass {
//                    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC1 with Class {
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC2 with BaseClass {
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC3 with InterfaceClass {
//                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC4 with FinalClass {
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC5 with SealedClass {
//                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC6 with AbstractClass {
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC7 with AbstractBaseClass {
//                      ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC8 with AbstractInterfaceClass {
//                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class AC9 with AbstractFinalClass {
//                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC1 with Class {
//                            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC2 with BaseClass {
//                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC3 with InterfaceClass {
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC4 with FinalClass {
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC5 with SealedClass {
//                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC6 with AbstractClass {
//                            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC7 with AbstractBaseClass {
//                            ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC8 with AbstractInterfaceClass {
//                            ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base class ABC9 with AbstractFinalClass {
//                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC1 with Class {
//                                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC2 with BaseClass {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC3 with InterfaceClass {
//                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC4 with FinalClass {
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC5 with SealedClass {
//                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC6 with AbstractClass {
//                                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC7 with AbstractBaseClass {
//                                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC8 with AbstractInterfaceClass {
//                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract interface class AIC9 with AbstractFinalClass {
//                                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC1 with Class {
//                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC2 with BaseClass {
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC3 with InterfaceClass {
//                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC4 with FinalClass {
//                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC5 with SealedClass {
//                             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC6 with AbstractClass {
//                             ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC7 with AbstractBaseClass {
//                             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC8 with AbstractInterfaceClass {
//                             ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract final class AFC9 with AbstractFinalClass {
//                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC1 with TypedefClass {
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC2 with TypedefBaseClass {
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC3 with TypedefInterfaceClass {
//             ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC4 with TypedefFinalClass {
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC5 with TypedefSealedClass {
//             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC6 with TypedefAbstractClass {
//             ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC7 with TypedefAbstractBaseClass {
//             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC8 with TypedefAbstractInterfaceClass {
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class TC9 with TypedefAbstractFinalClass {
//             ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
  print(C9);
  print(BC1);
  print(BC2);
  print(BC3);
  print(BC4);
  print(BC5);
  print(BC6);
  print(BC7);
  print(BC8);
  print(BC9);
  print(IC1);
  print(IC2);
  print(IC3);
  print(IC4);
  print(IC5);
  print(IC6);
  print(IC7);
  print(IC8);
  print(IC9);
  print(FC1);
  print(FC2);
  print(FC3);
  print(FC4);
  print(FC5);
  print(FC6);
  print(FC7);
  print(FC8);
  print(FC9);
  print(SC1);
  print(SC2);
  print(SC3);
  print(SC4);
  print(SC5);
  print(SC6);
  print(SC7);
  print(SC8);
  print(SC9);
  print(AC1);
  print(AC2);
  print(AC3);
  print(AC4);
  print(AC5);
  print(AC6);
  print(AC7);
  print(AC8);
  print(AC9);
  print(ABC1);
  print(ABC2);
  print(ABC3);
  print(ABC4);
  print(ABC5);
  print(ABC6);
  print(ABC7);
  print(ABC8);
  print(ABC9);
  print(AIC1);
  print(AIC2);
  print(AIC3);
  print(AIC4);
  print(AIC5);
  print(AIC6);
  print(AIC7);
  print(AIC8);
  print(AIC9);
  print(AFC1);
  print(AFC2);
  print(AFC3);
  print(AFC4);
  print(AFC5);
  print(AFC6);
  print(AFC7);
  print(AFC8);
  print(AFC9);
  print(TC1);
  print(TC2);
  print(TC3);
  print(TC4);
  print(TC5);
  print(TC6);
  print(TC7);
  print(TC8);
  print(TC9);
}
