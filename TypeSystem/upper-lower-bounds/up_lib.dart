// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Auxiliary library for `UP` tests.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';

void getVoid() {}
FutureOr<void> getFutureOrVoid() {}

class C {}

class D<T0, T1> {}

enum E { e0 }

extension type ET(int _) {}

typedef FPositional = int Function<X extends num>(X s, [int i]);
typedef FNamed = int Function<X extends num>(X s, {int i});
typedef Rec = (int, String, {bool b});

/// Object and FutureOr< Object > are subtypes of each other, which means that
/// we can't see the difference using `expectStaticType()` function. The
/// following code makes the distinction:
/// ```
/// import 'dart:async';
///
/// Future<X> f<X>() {
///   print(X);
///   return Future<Never>.error(0);
/// }
///
/// void main() {
///   Object o1 = 42;
///   FutureOr<Object> o2 = 42;
///
///   o1 = f(); // Prints 'dynamic'.
///   o2 = f(); // Prints 'Object'.
/// }
///```
Future<X> checkObject<X>() {
  checkObjectLog = '$X';
  return Future<X>.value(0 as dynamic);
}

String checkObjectLog = '';

void expectObject() {
  Expect.equals('dynamic', checkObjectLog);
  checkObjectLog = '';
}

void expectFutureOrObject() {
  Expect.equals('Object', checkObjectLog);
  checkObjectLog = '';
}
