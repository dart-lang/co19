// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `sealed` and
/// has a superdeclaration marked `base`. Test `base` superdeclaration in the
/// same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base class BaseClass {}
base mixin BaseMixin {}
base mixin class BaseMixinClass {}

sealed class ExtendsBaseClass extends BaseClass {}

sealed class ImplementsBaseClass implements BaseClass {}

sealed class ClassWithBaseMixin with BaseMixin {}

sealed class ClassWithBaseMixinClass with BaseMixinClass {}

main() {
  print(ExtendsBaseClass);
  print(ImplementsBaseClass);
  print(ClassWithBaseMixin);
  print(ClassWithBaseMixinClass);
}
