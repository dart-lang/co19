// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration declares a factory constructor, then
/// the downwards context for the purposes of inference of the body of the
/// constructor (or for inferring the type arguments to the redirectee in the
/// case of a redirecting factory constructor) is the un-instantiated on-type of
/// the extension.
///
/// @description Checks that the un-instantiated on-type of the extension is
/// used as the downwards context for the inference of the body of a
/// non-redirecting factory constructor declared in the extension. Test that it
/// is a compile-time error if an argument of the constructor invocation in the
/// body is not assignable to the type inferred from that context.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {
  C(X v);
}

extension ExtC<T> on C<T> {
  factory foo(int v) => C(v);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar(int v) {
    return C(v);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtCList<T> on C<List<T>> {
  factory baz(List<int> v) => C(v);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<X> {}

class MO<X> with M<X> {
  MO(X v);
}

extension ExtM<T> on M<T> {
  factory foo(int v) => MO(v);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC<X> {
  MC();
  factory MC.named(X v) => MC<X>();
}

extension ExtMC<T> on MC<T> {
  factory foo(int v) => MC.named(v);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET<X>(int _) {
  ET.named(X v) : this(0);
}

extension ExtET<T> on ET<T> {
  factory foo(int v) => ET.named(v);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
}
