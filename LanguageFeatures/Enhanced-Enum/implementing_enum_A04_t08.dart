// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// Because we want to allow interfaces and mixins that are intended to be
/// applied to enum declarations, and therefore to assume Enum to be a
/// superclass, we loosen that restriction to:
///
/// It's a compile-time error if a non-abstract class has Enum as a
/// superinterface (directly or transitively) unless it is the corresponding
/// class of an enum declaration.
///
/// It is a compile-time error if a class implements, extends or mixes-in the
/// class or interface introduced by an enum declaration. (An enum class can’t
/// be used as a mixin since it is not a mixin declaration and the class has a
/// superclass other than Object, but we include “mixes-in” for completeness.)
///
/// It's a compile-time error if a class or mixin declaration has Enum as a
/// superinterface and the interface of the declarations contains an instance
/// member with the name values, whether declared or inherited. If any concrete
/// class implements this interface, it will be an enum declaration class, and
/// then the values member would conflict with the static values constant getter
/// that is automatically added to enum declaration classes. Such an instance
/// values declaration is either useless or wrong, so we disallow it entirely.
///
/// It's a compile-time error if a class, mixin or enum declaration has Enum as
/// a superinterface, and it declares a non-abstract instance member named index.
/// That member would override the index getter inherited from Enum, and we
/// currently do not allow that.
///
/// Those restrictions allows abstract classes (interfaces) which implements
/// Enum in order to have the int index; getter member available, and it allows
/// mixin declarations to use Enum as an on type because mixin declarations
/// cannot be instantiated directly.
///
/// The restrictions still ensure enum values are the only object instances
/// which implements Enum, while making it valid to declare abstract class
/// MyInterface implements Enum and mixin MyMixin on Enum for interfaces and
/// mixins intended to be used in declaring enum classes. It's also impossible
/// to override or prevent the instance index and static values members without
/// causing a compile-time error. Say implementing an interface with
/// `Never get index;` as a member, then because it's not possible to override
/// `int get index;` from Enum, the resulting class does not implement its
/// interface and is a compile-time error.
///
/// @description Check that it's a compile-time error if a enum declaration has
/// Enum as a superinterface, and it declares a non-abstract instance member
/// named `index`.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2;

  void set index(int val) {}
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e1(42),
  e2(0);

  const E2(int i);
  void set index(List<E2> val) {}
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
