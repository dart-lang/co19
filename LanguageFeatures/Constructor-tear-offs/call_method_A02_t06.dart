// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We now allow both implicit and explicit instantiation of callable
/// objects (objects with an interface type which has a call method) when their
/// call method is generic.
///
/// Previously, the following code was invalid:
///
/// class Id {
///   T call<T>(T value) => value;
/// }
/// int Function(int) intId = Id();
/// We disallowed this code because callable objects were treated like function
/// objects, and we did not allow implicit instantiation of function objects,
/// only tear-offs. Even if call is an instance method, and we allowed implicit
/// instantiation of instance methods tear-offs, we chose to ignore that here
/// and treat the callable object as a function object. (We also implicitly
/// allowed instantiating the call method of actual function values, but it
/// didn't work on all our implementations.)
///
/// We now allow instantiating function objects, and therefore we do not need to
/// restrict callable objects either.
///
/// The variable initialization above will, after type inference, be
///
/// int Function(int) intId = Id().call<int>;
/// Also, we allow explicitly instantiating a callable object:
///
/// var intId = Id()<int>;
/// is also type-inferred to the same initialization.
///
/// That is, given an expression of the form e<typeArgs>, if e has a static type
/// which is a callable object, the expression is equivalent to
/// e.call<typeArgs>. Since no object with an interface type can otherwise
/// support type-instantiation, this coercion turns an error into useful code,
/// and allows a typed callable object to be consistently treated like a
/// function object equivalent to its call method.
///
/// @description Checks that it explicitly instantiated `call` method has
/// correct type
/// @author sgrekhov@unipro.ru
/// @issue 47212

// SharedOptions=--enable-experiment=constructor-tearoffs

T foo1<T>(T value) => value;

main() {
  var funcValue1 = foo1;
  var f1 = funcValue1.call<int>;
  f1(42);
  f1("Lily was here");
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  T foo2<T>(T value) => value;
  var funcValue2 = foo2;
  var f2 = funcValue2.call<int>;
  f2(42);
  f2("Lily was here");
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
