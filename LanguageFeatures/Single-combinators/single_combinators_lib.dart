// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar for import and export directives is modified to
/// allow at most one combinator.
///
/// @description Library used by the single combinators tests.
/// @author sgrekhov22@gmail.com

String a = 'a';
String b = 'b';
String c() => 'c';

class D {
  String get id => 'D';
}
