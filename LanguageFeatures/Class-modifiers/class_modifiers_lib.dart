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
