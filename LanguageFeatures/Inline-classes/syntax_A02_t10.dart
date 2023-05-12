// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'final'? 'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
///
/// @description Checks that it is a compile-time error if a `final inline`
/// class is implemented outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "inline_class_lib.dart";

class ClassImplementsFinal implements FinalInlineClass {
//                                    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

base class BaseClassImplementsFinal implements FinalInlineClass {
//                                             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

interface class InterfaceClassImplementsFinal implements FinalInlineClass {
//                                                       ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

final class FinalClassImplementsFinal implements FinalInlineClass {
//                                               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

sealed class SealedClassImplementsFinal implements FinalInlineClass {
//                                                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified  const SC(int id): super(id);
  int get x => 0;
}

abstract class AbstractClassImplementsFinal implements FinalInlineClass {
//                                                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

abstract base class AbstractBaseClassImplementsFinal implements FinalInlineClass {
//                                                              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

abstract interface class AbstractInterfaceClassImplementsFinal implements FinalInlineClass {
//                                                                        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

abstract final class AbstractFinalClassImplementsFinal implements FinalInlineClass {
//                                                                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

mixin class MixinClassImplementsFinal implements FinalInlineClass {
//                                               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

base mixin class BaseMixinClassImplementsFinal implements FinalInlineClass {
//                                                        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

abstract mixin class AbstractMixinClassImplementsFinal implements FinalInlineClass {
//                                                                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

abstract base mixin class AbstractBaseMixinClassImplementsFinal implements FinalInlineClass {
//                                                                         ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 0;
}

mixin Mixin implements FinalInlineClass {}
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixin implements FinalInlineClass {}
//                              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsFinal);
  print(BaseClassImplementsFinal);
  print(InterfaceClassImplementsFinal);
  print(FinalClassImplementsFinal);
  print(SealedClassImplementsFinal);
  print(AbstractClassImplementsFinal);
  print(AbstractBaseClassImplementsFinal);
  print(AbstractInterfaceClassImplementsFinal);
  print(AbstractFinalClassImplementsFinal);
  print(MixinClassImplementsFinal);
  print(BaseMixinClassImplementsFinal);
  print(AbstractMixinClassImplementsFinal);
  print(AbstractBaseMixinClassImplementsFinal);
  print(Mixin);
  print(BaseMixin);
}
