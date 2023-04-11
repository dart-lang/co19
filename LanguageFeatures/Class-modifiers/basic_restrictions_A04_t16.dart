// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `base` and
/// has a superdeclaration marked `sealed` in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class SealedClass {}

base class BaseExtendsSealedClass extends SealedClass {}

abstract base class AbstractBaseExtendsSealedClass extends SealedClass {}

base class BaseImplementsSealedClass implements SealedClass {}

abstract base class AbstractBaseImplementsSealedClass implements SealedClass {}

base mixin MixinOnSealedClass on SealedClass {}

base mixin MixinImplementsSealedClass implements SealedClass {}

base mixin class MixinClassImplementsSealedClass implements SealedClass {}

abstract base mixin class AbstractMixinClassImplementsSealedClass
    implements SealedClass {}

main() {
  print(BaseExtendsSealedClass);
  print(AbstractBaseExtendsSealedClass);
  print(BaseImplementsSealedClass);
  print(AbstractBaseImplementsSealedClass);
  print(MixinOnSealedClass);
  print(MixinImplementsSealedClass);
  print(MixinClassImplementsSealedClass);
  print(AbstractMixinClassImplementsSealedClass);
}
