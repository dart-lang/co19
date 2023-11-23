// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable if all the following conditions
/// hold:
/// - It refers to a field (not a getter)
/// - The field is private
/// - The field is final
/// - There is no getter with the same name elsewhere in the library
/// - There is no non-final field with the same name elsewhere in the library
/// - There is no implicit noSuchMethod forwarder with the same name elsewhere
///   in the library.
///
/// @description Checks that a class instance field is promotable if all of the
/// conditions above are met. Test all possible class modifiers
/// @author sgrekhov22@gmail.com
/// @issue 53436

class Class {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

base class BaseClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

interface class InterfaceClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

final class FinalClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

sealed class SealedClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

abstract class AbstractClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

abstract base class AbstractBaseClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

abstract interface class AbstractInterfaceClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

abstract final class AbstractFinalClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

mixin class MixinClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

base mixin class BaseMixinClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

abstract mixin class AbstractMixinClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

abstract base mixin class AbstractBaseMixinClass {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

mixin Mixin {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

base mixin BaseMixin {
  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

class ExtendsSealedClass extends SealedClass {}

class ExtendsAbstractClass extends AbstractClass {}

base class ExtendsAbstractBaseClass extends AbstractBaseClass {}

class ExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}

final class ExtendsAbstractFinalClass extends AbstractFinalClass {}

class ExtendsAbstractMixinClass extends AbstractMixinClass {}

base class ExtendsAbstractBaseMixinClass extends AbstractBaseMixinClass {}

class WithMixin = Object with Mixin;

base class WithBaseMixin = Object with BaseMixin;

main() {
  Class _class = Class();
  if (_class._x != null) {
    _class._x.isEven;
  }
  _class.test();

  BaseClass _baseClass = BaseClass();
  if (_baseClass._x != null) {
    _baseClass._x.isEven;
  }
  _baseClass.test();

  InterfaceClass _interfaceClass = InterfaceClass();
  if (_interfaceClass._x != null) {
    _interfaceClass._x.isEven;
  }
  _interfaceClass.test();

  FinalClass _finalClass = FinalClass();
  if (_finalClass._x != null) {
    _finalClass._x.isEven;
  }
  _finalClass.test();

  SealedClass _sealedClass = ExtendsSealedClass();
  if (_sealedClass._x != null) {
    _sealedClass._x.isEven;
  }
  _sealedClass.test();

  AbstractClass _abstractClass = ExtendsAbstractClass();
  if (_abstractClass._x != null) {
    _abstractClass._x.isEven;
  }
  _abstractClass.test();

  AbstractBaseClass _abstractBaseClass = ExtendsAbstractBaseClass();
  if (_abstractBaseClass._x != null) {
    _abstractBaseClass._x.isEven;
  }
  _abstractBaseClass.test();

  AbstractInterfaceClass _abstractInterfaceClass =
      ExtendsAbstractInterfaceClass();
  if (_abstractInterfaceClass._x != null) {
    _abstractInterfaceClass._x.isEven;
  }
  _abstractInterfaceClass.test();

  AbstractFinalClass _abstractFinalClass = ExtendsAbstractFinalClass();
  if (_abstractFinalClass._x != null) {
    _abstractFinalClass._x.isEven;
  }
  _abstractFinalClass.test();

  MixinClass _mixinClass = MixinClass();
  if (_mixinClass._x != null) {
    _mixinClass._x.isEven;
  }
  _mixinClass.test();

  BaseMixinClass _baseMixinClass = BaseMixinClass();
  if (_baseMixinClass._x != null) {
    _baseMixinClass._x.isEven;
  }
  _baseMixinClass.test();

  AbstractMixinClass _abstractMixinClass = ExtendsAbstractMixinClass();
  if (_abstractMixinClass._x != null) {
    _abstractMixinClass._x.isEven;
  }
  _abstractMixinClass.test();

  AbstractBaseMixinClass _abstractBaseMixinClass =
      ExtendsAbstractBaseMixinClass();
  if (_abstractBaseMixinClass._x != null) {
    _abstractBaseMixinClass._x.isEven;
  }
  _abstractBaseMixinClass.test();

  WithMixin _withMixin = WithMixin();
  if (_withMixin._x != null) {
    _withMixin._x.isEven;
  }
  _withMixin.test();

  WithBaseMixin _withBaseMixin = WithBaseMixin();
  if (_withBaseMixin._x != null) {
    _withBaseMixin._x.isEven;
  }
  _withBaseMixin.test();
}
