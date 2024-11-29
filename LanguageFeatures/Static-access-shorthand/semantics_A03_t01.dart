// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Dart semantics, static and dynamic, do not follow the grammar
/// precisely. For example, a static member invocation expression of the form
/// `C.id<T1>(e2)` is treated as an atomic entity for type inference (and
/// runtime semantics). It’s not a combination of doing a `C.id` tear-off, then
/// a `<T1>` instantiation and then an `(e2)` invocation. The context type of
/// that entire expression is used throughout the inference, where
/// `(e1.id<T1>)(e2)` has `(e1.id<T1>)` in a position where it has no context
/// type.
///
/// Because of that, the specification of the static and runtime semantics of
/// the new constructs needs to address all the forms `.id`, `.id<typeArgs>`,
/// `.id(args)`, `.id<typeArgs>(args)`, `.new` or `.new(args)`.
/// ...
/// The general rule is that any of the expression forms above, starting with
/// `.id`, are treated exactly as if they were preceded by a fresh prefixed
/// identifier `_p.C` which denotes the declaration of the type of the context
/// type scheme of the entire `<staticMemberShorthand>`.
///
/// @description Checks that it is still a compile-time error if the return type
/// of the shorthand is not assignable to the type of the left hand expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C<T> {
  T value;
  C(this.value);

  static C<int> get id1 => C<int>(0);
  static C<Y> id2<Y>(Y y) => C<Y>(y);
}

mixin M<X> on C<X> {
  static M<int> get id1 => MC<int>(1);
  static M<Y> id2<Y>(Y y) => MC<Y>(y);
}
class MC<T> = C<T> with M<T>;

enum E<X> {
  e0(2);
  final X value;
  const E(this.value);

  static E<int> get id1 => E.e0;
}

extension type ET<X>(X v) {
  static ET<int> get id1 => ET<int>(3);
  static ET<Y> id2<Y>(Y y) => ET<Y>(y);
}

main() {
  C<String> c1 = .id1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  C<int> c2 = .id2<String>("c2");
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String> m1 = .id1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  M<int> m2 = .id2<String>("m2");
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<String> e1 = .id1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String> et1 = .id1;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  ET<int> et2 = .id2<String>("et2");
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
