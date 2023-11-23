// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Helper library for `const_evaluation_A*` tests
///
/// @author iarkh@unipro.ru

class C<T> {
  final T x;
  void test(Object? o) { o as T; }
  const C(Object? o) : x = o as T;
  const C.t(Object? o, T t) : x = o as T;
}

class C1<T> {
  void test(Object? o) { o as T; }
  const C1();
  const C1.t(T t);
}
