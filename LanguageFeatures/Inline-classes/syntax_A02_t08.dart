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
/// @description Checks that it is a compile-time error to extend, implement (by
/// non-inline class) or declare a mixin on a `final inline` class even in the
/// same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

final inline class FinalInlineClass {
  final int x;
  const FinalInlineClass([this.x = 0]);
}

class ClassExtendsFinal extends FinalInlineClass {}
//                              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassExtendsFinal extends FinalInlineClass {}
//                                       ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsFinal extends FinalInlineClass {}
//                                                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsFinal extends FinalInlineClass {}
//                                         ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsFinal extends FinalInlineClass {}
//                                           ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified  const SC(int id): super(id);

abstract class AbstractClassExtendsFinal extends FinalInlineClass {}
//                                               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsFinal extends FinalInlineClass {}
//                                                        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsFinal extends FinalInlineClass {}
//                                                                  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsFinal extends FinalInlineClass {}
//                                                          ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassExtendsFinal extends FinalInlineClass {}
//                                         ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassExtendsFinal extends FinalInlineClass {}
//                                                  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsFinal extends FinalInlineClass {}
//                                                          ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassExtendsFinal extends FinalInlineClass {}
//                                                                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin Mixin on FinalInlineClass {}
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixin on FinalInlineClass {}
//                      ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsFinal);
  print(BaseClassExtendsFinal);
  print(InterfaceClassExtendsFinal);
  print(FinalClassExtendsFinal);
  print(SealedClassExtendsFinal);
  print(AbstractClassExtendsFinal);
  print(AbstractBaseClassExtendsFinal);
  print(AbstractInterfaceClassExtendsFinal);
  print(AbstractFinalClassExtendsFinal);
  print(MixinClassExtendsFinal);
  print(BaseMixinClassExtendsFinal);
  print(AbstractMixinClassExtendsFinal);
  print(AbstractBaseMixinClassExtendsFinal);
  print(Mixin);
  print(BaseMixin);
}
