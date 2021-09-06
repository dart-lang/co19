// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the issue 33699 (Dart does not throw error
/// if function argument parameter extends void) Checks that function cannot have
/// parameter which extends [void].
/// @Issue 33699
/// @author iarkh@unipro.ru


typedef F<X extends void> = void Function();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
main() {}
