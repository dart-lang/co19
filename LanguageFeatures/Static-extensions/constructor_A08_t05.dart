// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a redirecting factory constructor
/// declared in an extension has a redirection target which is not a subtype of
/// the un-instantiated on-type of the extension (after inference has been
/// performed).
///
/// In addition, all of the usual compile-time errors associated with
/// declarations of redirecting factory constructors continue to apply.
///
/// @description Checks that it is a compile-time error if a redirecting factory
/// constructor declared in an extension redirects to a generative constructor
/// of an abstract class or of an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

abstract class A<T> {
  A();
}

abstract mixin class AMC<T> {
  AMC();
}

enum E<T> {
  e0;
  const E();
}

extension ExtA<T> on A<T> {
  factory foo() = A<T>.new;
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtAMC<T> on AMC<T> {
  factory foo() = AMC<T>.new;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE<T> on E<T> {
  factory foo() = E<T>.new;
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(AMC);
  print(E);
}
