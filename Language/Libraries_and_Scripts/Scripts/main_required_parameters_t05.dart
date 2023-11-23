// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let L be a library that exports a declaration D named main.
/// ...
/// It is a compile-time error if D declares more than two required positional
/// parameters, or if there are any required named parameters.
///
/// @description Checks that main function can have 'var args' argument.
/// @author iarkh@unipro.ru

void main(var args) {
}
