// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33703 (Dart does not throw error
/// if class argument parameter extends Null).
///
/// Finally, analyzer behavior was updated, so the test checks that class type
/// parameter can extend [Null].
///
/// @Issue 33703, 33709
/// @author iarkh@unipro.ru


class A1<X extends Null> {}
class A2<X extends Never> {}

main() {}
