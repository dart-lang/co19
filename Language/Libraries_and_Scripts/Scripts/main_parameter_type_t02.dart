// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let L be a library that exports a declaration D named main.
/// ...
///  It is a compile-time error if D declares at least one positional parameter,
///  and the first positional parameter has a type which is not a supertype of
///  List<String>
///
/// @description Checks that it is no compile-time error if D declares at least
/// one positional parameter, and the first positional parameter has a type which
/// is a supertype of List<String>
/// @author sgrekhov@unipro.ru

main(Object args) {
}
