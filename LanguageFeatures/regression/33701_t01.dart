/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33701 (Dart does not throw error
 * if function argument parameter extends [Null]). Checks that function
 * parameter argument cannot be of [Null] type
 * @compile-error
 * @Issue 33701
 * @author iarkh@unipro.ru
 */

X testme<X extends Null>() {return Null; }

main() {}
