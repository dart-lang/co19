/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33703 (Dart does not throw error
 * if class argument parameter extends Null).
 * @compile-error
 * @Issue 33703
 * @author iarkh@unipro.ru
 */
class A<X extends Null> {}

main() {}
