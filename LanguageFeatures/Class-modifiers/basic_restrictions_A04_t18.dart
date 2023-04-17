// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `sealed` and
/// has a superdeclaration marked `final` in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class FinalClass {}
abstract final class AbstractFinalClass {}

sealed class ExtendsFinalClass extends FinalClass {}

sealed class ImplementsFinalClass implements FinalClass {}

sealed class ExtendsAbstractFinalClass extends AbstractFinalClass {}

sealed class ImplementsAbstractFinalClass implements AbstractFinalClass {}

main() {
  print(ExtendsFinalClass);
  print(ImplementsFinalClass);

  print(ExtendsAbstractFinalClass);
  print(ImplementsAbstractFinalClass);
}
