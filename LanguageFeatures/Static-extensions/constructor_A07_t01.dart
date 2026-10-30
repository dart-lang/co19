// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration declares a factory constructor, then
/// the downwards context for the purposes of inference of the body of the
/// constructor (or for inferring the type arguments to the redirectee in the
/// case of a redirecting factory constructor) is the un-instantiated on-type of
/// the extension.
/// ...
/// It is a compile-time error if a redirecting factory constructor declared in
/// an extension has a redirection target which is not a subtype of the
/// un-instantiated on-type of the extension (after inference has been performed).
///
/// @description Checks that it is a compile-time error if a redirecting factory
/// constructor declared in an extension has a redirection target which is not a
/// subtype of the un-instantiated on-type of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

class D1<X> extends C<int> {}

class D2<X> extends C<List<X>> {}

class D3 extends C<int> {}

class D4<X> {}

mixin M<X> {}

class MO1<X> with M<int> {}

class MO2<X> {}

mixin class MC<X> {}

class MC1<X> extends MC<int> {}

extension type ET<X>(int _) {}

extension type ET1<X>(int _) implements ET<int> {}

extension ExtC<T> on C<T> {
  factory foo1() = D1.new;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = D2.new;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3() = D2<T>.new;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4() = D3.new;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5() = D4.new;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6() = Object.new;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo1() = MO1.new;
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = MO2.new;
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo() = MC1.new;
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo(int v) = ET1.new;
//                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
}
