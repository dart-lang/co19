/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33184 (No error when run dart
 * class with incorrect instantiation to bound)
 * @compile-error
 * @author iarkh@unipro.ru
 */
class D<T extends Comparable<T>> {}
class E<T extends D> {}
main() {}