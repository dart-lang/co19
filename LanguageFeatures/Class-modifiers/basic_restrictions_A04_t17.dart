// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `final` and
/// has a superdeclaration marked `final` in the same library
/// @author sgrekhov22@gmail.com

final class FinalClass {}
abstract final class AbstractFinalClass {}

final class FinalExtendsFinalClass extends FinalClass {}

abstract final class AbstractFinalExtendsFinalClass extends FinalClass {}

final class FinalImplementsFinalClass implements FinalClass {}

abstract final class AbstractFinalImplementsFinalClass implements FinalClass {}

final class FinalExtendsAbstractFinalClass extends AbstractFinalClass {}

abstract final class AbstractFinalExtendsAbstractFinalClass
    extends AbstractFinalClass {}

final class FinalImplementsAbstractFinalClass implements AbstractFinalClass {}

abstract final class AbstractFinalImplementsAbstractFinalClass
    implements AbstractFinalClass {}

enum EnumImplementsFinalClass implements FinalClass {e1, e2}

enum EnumImplementsAbstractFinalClass implements AbstractFinalClass {e1, e2}

main() {
  print(FinalExtendsFinalClass);
  print(AbstractFinalExtendsFinalClass);
  print(FinalImplementsFinalClass);
  print(AbstractFinalImplementsFinalClass);
  print(FinalExtendsAbstractFinalClass);
  print(AbstractFinalExtendsAbstractFinalClass);
  print(FinalImplementsAbstractFinalClass);
  print(AbstractFinalImplementsAbstractFinalClass);
  print(EnumImplementsFinalClass);
  print(EnumImplementsAbstractFinalClass);
}
