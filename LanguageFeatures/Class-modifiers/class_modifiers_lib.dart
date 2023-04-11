// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library defining some base classes for testing class modifiers
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

library class_modifiers_lib;

final class FinalClass {}
interface class InterfaceClass {}
sealed class SealedClass {}
base class BaseClass {}

base mixin BaseMixin {}
base mixin class BaseMixinClass {}

typedef TypedefFinalClass = FinalClass;
typedef TypedefInterfaceClass = InterfaceClass;
typedef TypedefSealedClass = SealedClass;
typedef TypedefBaseClass = BaseClass;

class ExtendsSealedClass extends SealedClass {}
class ImplementsSealedClass implements SealedClass {}
mixin MixinOnSealed on SealedClass {}
/*
base class BaseExtendsBaseClass extends BaseClass {}
final class FinalExtendsBaseClass extends BaseClass {}
sealed class SealedExtendsBaseClass extends BaseClass {}
base mixin BaseMixinOnBaseClass on BaseClass {}

base class BaseImplementsBaseClass implements BaseClass {}
final class FinalImplementsBaseClass implements BaseClass {}
sealed class SealedImplementsBaseClass implements BaseClass {}
base mixin BaseMixinImplementsBaseClass implements BaseClass {}

base class BaseExtendsFinalClass extends FinalClass {}
final class FinalExtendsFinalClass extends FinalClass {}
sealed class SealedExtendsFinalClass extends FinalClass {}
base mixin BaseMixinOnFinalClass on FinalClass {}
*/
