// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Otherwise, `M` only includes extensions containing constructors with the
/// requested name. A compile-time error occurs if `M` is empty, or `M` contains
/// two or more elements. Otherwise, the invocation or reference denotes an
/// invocation of or reference to the constructor with uniform base constructor
/// name `name` which is declared by the extension declaration that `M`
/// contains.
///
/// Note that no attempt is made to determine that some constructors are "more
/// specific" or "less specific", it is simply a conflict if there are multiple
/// constructors with the requested name in the accessible extensions.
///
/// @description Checks that it is a compile-time error if `M` contains two or
/// more elements even if one of the constructors is more specific than the
/// others, that is, the on-type of its extension is a subtype of the other
/// on-types and its parameter type is a subtype of the other parameter types.
/// Test also that it is an error if the type arguments of `C` satisfy the
/// on-type and the bounds of only one of the extensions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {
  C._();
}

mixin M<X> {}

class MO<X> with M<X> {
  MO._();
}

mixin class MC<X> {
  MC._();
}

enum E<X> {
  e0<Never>._();

  const E._();
}

extension type ET<X>._(int _) {}

extension ExtC1<T> on C<T> {
  factory named(Object? _) => C<T>._();
  factory(Object? _) => C<T>._();
}

extension ExtC2<T extends num> on C<T> {
  factory named(num _) => C<T>._();
  factory(num _) => C<T>._();
}

extension ExtC3 on C<int> {
  factory named(int _) => C<int>._();
  factory(int _) => C<int>._();
}

extension ExtM1<T> on M<T> {
  factory named(Object? _) => MO<T>._();
  factory(Object? _) => MO<T>._();
}

extension ExtM2<T extends num> on M<T> {
  factory named(num _) => MO<T>._();
  factory(num _) => MO<T>._();
}

extension ExtM3 on M<int> {
  factory named(int _) => MO<int>._();
  factory(int _) => MO<int>._();
}

extension ExtMC1<T> on MC<T> {
  factory named(Object? _) => MC<T>._();
  factory(Object? _) => MC<T>._();
}

extension ExtMC2<T extends num> on MC<T> {
  factory named(num _) => MC<T>._();
  factory(num _) => MC<T>._();
}

extension ExtMC3 on MC<int> {
  factory named(int _) => MC<int>._();
  factory(int _) => MC<int>._();
}

extension ExtE1<T> on E<T> {
  factory named(Object? _) => E.e0;
  factory(Object? _) => E.e0;
}

extension ExtE2<T extends num> on E<T> {
  factory named(num _) => E.e0;
  factory(num _) => E.e0;
}

extension ExtE3 on E<int> {
  factory named(int _) => E.e0;
  factory(int _) => E.e0;
}

extension ExtET1<T> on ET<T> {
  factory named(Object? _) => ET<T>._(0);
  factory(Object? _) => ET<T>._(0);
}

extension ExtET2<T extends num> on ET<T> {
  factory named(num _) => ET<T>._(0);
  factory(num _) => ET<T>._(0);
}

extension ExtET3 on ET<int> {
  factory named(int _) => ET<int>._(0);
  factory(int _) => ET<int>._(0);
}

main() {
  C<int>.named(1);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>(1);
//^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.new(1);
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.named;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.new;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<String>.named("");
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<String>("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  C<String>.new("");
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<String>.named;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<String>.new;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.named(1);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>(1);
//^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.new(1);
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.named;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.new;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String>.named("");
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String>("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  M<String>.new("");
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String>.named;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String>.new;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.named(1);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>(1);
//^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.new(1);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.named;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.new;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String>.named("");
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String>("");
//^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String>.new("");
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String>.named;
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String>.new;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.named(1);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>(1);
//^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.new(1);
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.named;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.new;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<String>.named("");
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<String>("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  E<String>.new("");
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<String>.named;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<String>.new;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.named(1);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>(1);
//^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.new(1);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.named;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.new;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String>.named("");
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String>("");
//^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String>.new("");
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String>.named;
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String>.new;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
