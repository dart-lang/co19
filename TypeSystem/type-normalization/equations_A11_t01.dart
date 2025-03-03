// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The NORM relation defines the canonical representative of classes
/// of equivalent types...
/// This is based on the following equations:
///   FutureOr<T> == T if Future<T> <: T
///
/// @description Checks that if Future<T> <: T then FutureOr<T> == T
/// @author sgrekhov@unipro.ru

import 'dart:async';

class A<X> {}
class B<X> implements A<X> {}

class CO extends B<FutureOr<Object>> implements A<Object> {}
class CD extends B<FutureOr<dynamic>> implements A<dynamic> {}
class CV extends B<FutureOr<void>> implements A<void> {}

main() {
  new CO();
  new CD();
  new CV();
}
