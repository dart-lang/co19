/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A [spreadElement] starting with [...?] is a constant element if its
 * expression is constant and it evaluates to [null] or a constant [List], [Set]
 * or [Map] instance originally created by a list, set or map literal. It is a
 * potentially constant element if the expression is potentially constant
 * expression.
 * @description: Checks that constant list spread [...?] element cannot be
 * non-constant, non-null and not list or set.
 * @author iarkh@unipro.ru
 */

List? l = [];
Set? s = {};

const Map? m1 = {1: 1};
Map? m2 = {2: 2};

const int? i1 = 25;
int? i2 = 25;

main() {
  const List res1 = const [...?l];
// [error line 28, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const List res2 = const [...?s];
// [error line 32, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const List res3 = const [...?m1];
// [error line 36, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const List res4 = const [...?m2];
// [error line 40, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const List res5 = const [...?i1];
// [error line 44, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const List res6 = const [...?i2];
// [error line 48, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
