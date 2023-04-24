// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library defining some base classes for testing class modifiers
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

library class_modifiers_lib;

class Class {}
base class BaseClass {}
interface class InterfaceClass {}
final class FinalClass {}
sealed class SealedClass {}
abstract class AbstractClass {}
abstract base class AbstractBaseClass {}
abstract interface class AbstractInterfaceClass {}
abstract final class AbstractFinalClass {}
mixin class MixinClass {}
base mixin class BaseMixinClass {}
abstract mixin class AbstractMixinClass {}
abstract base mixin class AbstractBaseMixinClass {}
mixin Mixin {}
base mixin BaseMixin {}

typedef TypedefBaseClass = BaseClass;
typedef TypedefInterfaceClass = InterfaceClass;
typedef TypedefFinalClass = FinalClass;
typedef TypedefSealedClass = SealedClass;
typedef TypedefAbstractClass = AbstractClass;
typedef TypedefAbstractBaseClass = AbstractBaseClass;
typedef TypedefAbstractInterfaceClass = AbstractInterfaceClass;
typedef TypedefAbstractFinalClass = AbstractFinalClass;
typedef TypedefMixinClass = MixinClass;
typedef TypedefBaseMixinClass = BaseMixinClass;
typedef TypedefAbstractBaseMixinClass = AbstractBaseMixinClass;
typedef TypedefMixin = Mixin;
typedef TypedefBaseMixin = BaseMixin;

class ExtendsClass1 extends Class {}
class ExtendsClass2 extends Class {}

base class BaseExtendsBaseClass1 extends BaseClass {}
base class BaseExtendsBaseClass2 extends BaseClass {}

class ExtendsInterfaceClass1 extends InterfaceClass {} // reopen
interface class ExtendsInterfaceClass2 extends InterfaceClass {}

final class ExtendsFinalClass1 extends FinalClass {}
final class ExtendsFinalClass2 extends FinalClass {}

class ExtendsSealedClass extends SealedClass {}
class ImplementsSealedClass implements SealedClass {}
mixin MixinOnSealed on SealedClass {}

class ExtendsAbstractClass1 extends AbstractClass {}
class ExtendsAbstractClass2 extends AbstractClass {}

base class BaseClassExtendsAbstractBaseClass1 extends AbstractBaseClass {}
base class BaseClassExtendsAbstractBaseClass2 extends AbstractBaseClass {}

class ExtendsAbstractInterfaceClass1 extends AbstractInterfaceClass {} // reopen
interface class ExtendsAbstractInterfaceClass2 extends AbstractInterfaceClass {}

final class ExtendsAbstractFinalClass1 extends AbstractFinalClass {}
final class ExtendsAbstractFinalClass2 extends AbstractFinalClass {}

ExtendsSealedClass extendsSealedClass = ExtendsSealedClass();
