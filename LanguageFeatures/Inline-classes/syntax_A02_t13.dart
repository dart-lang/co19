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

base inline class BaseInlineClass1 {
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseInlineClass1(this.id);
}

inline base class BaseInlineClass2 {
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseInlineClass2(this.id);
}

interface inline class InterfaceInlineClass1 {
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  InterfaceInlineClass1(this.id);
}

inline interface class InterfaceInlineClass2 {
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  InterfaceInlineClass2(this.id);
}

sealed inline class SealedInlineClass1 {
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  SealedInlineClass1(this.id);
}

inline sealed class SealedInlineClass2 {
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  SealedInlineClass2(this.id);
}

abstract inline class AbstractInlineClass1 {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInlineClass1(this.id);
}

inline abstract class AbstractInlineClass2 {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInlineClass2(this.id);
}

abstract base inline class AbstractBaseInlineClass1 {
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseInlineClass1(this.id);
}

abstract inline base class AbstractBaseInlineClass2 {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseInlineClass2(this.id);
}

inline abstract base class AbstractBaseInlineClass3 {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseInlineClass3(this.id);
}

abstract interface inline class AbstractInterfaceInlineClass1 {
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInterfaceInlineClass1(this.id);
}

abstract inline interface class AbstractInterfaceInlineClass2 {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInterfaceInlineClass2(this.id);
}

inline abstract interface class AbstractInterfaceInlineClass3 {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractInterfaceInlineClass3(this.id);
}

abstract final inline class AbstractFinalInlineClass1 {
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractFinalInlineClass1(this.id);
}

abstract inline final class AbstractFinalInlineClass2 {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractFinalInlineClass2(this.id);
}

inline abstract final class AbstractFinalInlineClass3 {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractFinalInlineClass3(this.id);
}


mixin inline class MixinInlineClass1 {
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  MixinInlineClass1(this.id);
}

inline mixin class MixinInlineClass2 {
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  MixinInlineClass2(this.id);
}

base mixin inline class BaseMixinInlineClass1 {
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseMixinInlineClass(this.id);
}

base inline mixin class BaseMixinInlineClass2 {
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseMixinInlineClass2(this.id);
}

inline base mixin class BaseMixinInlineClass3 {
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  BaseMixinInlineClass3(this.id);
}

abstract mixin inline class AbstractMixinInlineClass1 {
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractMixinInlineClass1(this.id);
}

abstract inline mixin class AbstractMixinInlineClass2 {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractMixinInlineClass2(this.id);
}

inline abstract mixin class AbstractMixinInlineClass3 {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractMixinInlineClass3(this.id);
}

abstract base mixin inline class AbstractBaseMixinInlineClass1 {
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseMixinInlineClass1(this.id);
}

abstract base inline mixin class AbstractBaseMixinInlineClass2 {
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseMixinInlineClass2(this.id);
}

abstract inline base mixin class AbstractBaseMixinInlineClass3 {
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseMixinInlineClass3(this.id);
}

inline abstract base mixin class AbstractBaseMixinInlineClass4 {
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  AbstractBaseMixinInlineClass4(this.id);
}

main() {
  print(BaseInlineClass1);
  print(BaseInlineClass2);
  print(InterfaceInlineClass1);
  print(InterfaceInlineClass2);
  print(SealedInlineClass1);
  print(SealedInlineClass2);
  print(AbstractInlineClass1);
  print(AbstractInlineClass2);
  print(AbstractBaseInlineClass1);
  print(AbstractBaseInlineClass2);
  print(AbstractBaseInlineClass3);
  print(AbstractInterfaceInlineClass1);
  print(AbstractInterfaceInlineClass2);
  print(AbstractInterfaceInlineClass3);
  print(AbstractFinalInlineClass1);
  print(AbstractFinalInlineClass2);
  print(AbstractFinalInlineClass3);
  print(MixinInlineClass1);
  print(MixinInlineClass2);
  print(BaseMixinInlineClass1);
  print(BaseMixinInlineClass2);
  print(BaseMixinInlineClass3);
  print(AbstractMixinInlineClass1);
  print(AbstractMixinInlineClass2);
  print(AbstractMixinInlineClass3);
  print(AbstractBaseMixinInlineClass1);
  print(AbstractBaseMixinInlineClass2);
  print(AbstractBaseMixinInlineClass3);
  print(AbstractBaseMixinInlineClass4);
}
