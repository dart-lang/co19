// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar for import and export directives is modified to
/// allow at most one combinator.
///
/// @description Library used by `syntax_A01_t05.dart`.
/// @author sgrekhov22@gmail.com

export 'single_combinators_lib.dart' show a;
export 'single_combinators_lib.dart' hide a, b;
export 'dart:math';
export 'dart:async' show Future;
