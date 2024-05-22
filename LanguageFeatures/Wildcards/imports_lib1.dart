// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Import prefixes named `_` are non-binding and will provide access
/// to the extensions in that library.
///
/// @description Checks that an import prefix named `_` is non binding and
/// provides access to the imported library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

library imports_lib1;

int theAnswer = 42;
