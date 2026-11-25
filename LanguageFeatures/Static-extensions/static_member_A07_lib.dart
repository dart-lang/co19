// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the case where `D` does not declare any static members whose
/// basename is the basename of `m`, and `D` does not declare any constructors
/// named `C.m2` where `m2` is the basename of `m`, let `M` be the set
/// containing each accessible extension whose on-declaration is `D`, and whose
/// static members include one with the name `m`, or which declares a
/// constructor named `C.m`.
/// ...
/// An error occurs if `M` is empty, or `M` contains more than one member.
///
/// @description Library which re-exports the declarations from
/// `constructor_A12_lib.dart`, but not the extensions declared there. Used by
/// the tests that check that extensions which are not accessible in the
/// importing library are not included in `M`.
/// @author sgrekhov22@gmail.com

export 'constructor_A12_lib.dart' show C, M, MO, MC, E, ET;
