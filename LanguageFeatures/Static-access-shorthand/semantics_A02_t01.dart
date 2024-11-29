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
/// @description Checks that it is a compile-time error if in a shorthand
/// expression of the form `.id`, `.id()` or `.id<...>()` the type of the
/// context doesn't declare member named `id`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';

class C<T> {
  T v;
  C(this.v);

  static C<int> get instance => C<int>(0);
}

mixin M<T> on C<T>{
  static M<int> get instance => MC<int>(1);
}
class MC<T> = C<T> with M<T>;

enum E<T> {
  e0;
}

extension type ET<T>(int _) {
  static ET<int> get instance => ET<int>(0);
}

main() {
  dynamic v1 = .id;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  void v2 = .id();
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  Null v3 = .id<int>();
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  Never v4 = .id;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<dynamic> v5 = .id;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<void> v6 = .id();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<Null> v7 = .id<int>();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<Never> v8 = .id;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  C c1 = .id;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  C<int> c2 = .id();
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<C> c3 = .id<int>();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  Future<C<int>> c4 = .instance;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  M m1 = .id;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  M<int> m2 = .id();
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<M> m3 = .id<int>();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  Future<M<int>> m4 = .instance;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  E e1 = .id;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  E<int> e2 = .id();
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<E> e3 = .id<int>();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  Future<E> e3 = .values[0];
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  ET et1 = .id;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int> et2 = .id();
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<ET> et3 = .id<int>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  Future<ET> et4 = .instance;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
