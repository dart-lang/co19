/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33864 (Analyzer throws exception
 * if function optional argument is omitted and it's parametrized).
 * @Issue #33864
 * @author iarkh@unipro.ru
 */
testme1<X extends List<X>>() {}
testme2<X extends List<int>>() {}

main() {
  testme1();
  testme2();
}

