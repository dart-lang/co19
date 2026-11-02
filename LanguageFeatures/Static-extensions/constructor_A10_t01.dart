// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As usual, it is an error if type arguments are passed to an
/// extension and the extension either declares no type parameters, or if the
/// number of type parameters declared does not match the number of type
/// arguments, or if the type arguments do not match the declared bounds of the
/// type parameters.
///
/// @description Checks that it is a compile-time error if type arguments are
/// passed to an extension which declares no type parameters in an invocation
/// of the form `E<TypeArguments>.name(arguments)`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

mixin M<X> {}

class MO<X> with M<X> {}

mixin class MC<X> {}

enum E<X> {
  e0<int>();
}

extension type ET<X>(int _) {}

extension ExtC on C<int> {
  factory() => C<int>();
  factory named() => C<int>();
}

extension ExtM on M<int> {
  factory() => MO<int>();
  factory named() => MO<int>();
}

extension ExtMC on MC<int> {
  factory() => MC<int>();
  factory named() => MC<int>();
}

extension ExtE on E<int> {
  factory named() => E.e0;
}

extension ExtET on ET<int> {
  factory(int v) => ET<int>(v);
  factory named(int v) => ET<int>(v);
}

main() {
  ExtC<int>.new();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtC<int>.named();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM<int>.new();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM<int>.named();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC<int>.new();
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC<int>.named();
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtE<int>.named();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET<int>.new(0);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET<int>.named(0);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
