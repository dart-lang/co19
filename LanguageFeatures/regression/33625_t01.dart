// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33625 (No error when run dart
/// class with incorrect instantiation to bound for functions). Checks that
///    [typedef F<X> = X Function();
///    typedef G<X extends F> = X Function();]
/// does not throw a compile error (actually, it was an analyzer bug, see Issue
/// 33625 evaluation for more details).
/// @Issue 33625
/// @author iarkh@unipro.ru


typedef F<X> = X Function();
typedef G<X extends F> = X Function();
main() {}
