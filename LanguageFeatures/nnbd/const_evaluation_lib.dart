/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion With sound null safety, all generic const constructors and
 * generic const literals are evaluated using the actual type arguments
 * provided, whether legacy or non-legacy. This ensures that with sound null
 * safety, the final consistent semantics are obeyed.
 *
 * @description Checks statically that actual generic class type parameter is
 * evaluated correctly for [int?] type argument.
 *
 * @author iarkh@unipro.ru
 */

class C<T> {
  final T x;
  void test(Object? o) { o as T; }
  const C(Object? o) : x = o as T;
}

class C1<T> {
  void test(Object? o) { o as T; }
  const C1();
}
