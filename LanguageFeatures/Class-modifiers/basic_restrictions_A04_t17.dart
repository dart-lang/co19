// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `final` and
/// has a superdeclaration marked `sealed` in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class SealedClass {}

final class FinalExtendsSealedClass extends SealedClass {}

abstract final class AbstractFinalExtendsSealedClass extends SealedClass {}

final class FinalImplementsSealedClass implements SealedClass {}

abstract final class AbstractFinalImplementsSealedClass implements SealedClass {}

main() {
  print(FinalExtendsSealedClass);
  print(AbstractFinalExtendsSealedClass);
  print(FinalImplementsSealedClass);
  print(AbstractFinalImplementsSealedClass);
}
