// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the issue 33703 (Dart does not throw error
/// if class argument parameter extends Null).
/// @Issue 33703
/// @author iarkh@unipro.ru

class A<X extends Null> {}

main() {}
