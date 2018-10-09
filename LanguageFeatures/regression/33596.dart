/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33596 (Dart VM does not allow a
 * mixin of a class with itself). Checks that class cannot extends some class
 * and be a mixin with this.
 * @compile-error
 * @Issue 33596
 * @author iarkh@unipro.ru
 */
class M {}
class O extends M with M {}

main() {}