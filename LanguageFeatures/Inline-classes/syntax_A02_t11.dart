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
/// @description Checks that it is a compile-time error if an `inline` class has
/// a modifier which is not `final`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

base inline class BaseInlineClass {
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseInlineClass(this.id);
}

interface inline class InterfaceInlineClass {
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  InterfaceInlineClass(this.id);
}

sealed inline class SealedInlineClass {
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  SealedInlineClass(this.id);
}

abstract inline class AbstractInlineClass {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInlineClass(this.id);
}

abstract base inline class AbstractBaseInlineClass {
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseInlineClass(this.id);
}

abstract interface inline class AbstractInterfaceInlineClass {
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInterfaceInlineClass(this.id);
}

abstract final inline class AbstractFinalInlineClass {
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractFinalInlineClass(this.id);
}

mixin inline class MixinInlineClass {
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  MixinInlineClass(this.id);
}

base mixin inline class BaseMixinInlineClass {
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseMixinInlineClass(this.id);
}

abstract mixin inline class AbstractMixinInlineClass {
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractMixinInlineClass(this.id);
}

abstract base mixin inline class AbstractBaseMixinInlineClass {
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseMixinInlineClass(this.id);
}

main() {
  print(BaseInlineClass);
  print(InterfaceInlineClass);
  print(SealedInlineClass);
  print(AbstractInlineClass);
  print(AbstractBaseInlineClass);
  print(AbstractInterfaceInlineClass);
  print(AbstractFinalInlineClass);
  print(MixinInlineClass);
  print(BaseMixinInlineClass);
  print(AbstractMixinInlineClass);
  print(AbstractBaseMixinInlineClass);
}
