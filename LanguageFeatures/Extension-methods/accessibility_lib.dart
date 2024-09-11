// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for accessibility tests
///
/// @description Common library for accessibility tests. Declares `StringExt`,
/// `_StringExt` and an unnamed extension on `String`.
/// @author sgrekhov22@gmail.com

extension StringExt on String {
  String get id1 => "StringExt";
}

extension StringExt2 on String {
  String get id2 => "StringExt2";
}

extension _StringExt on String {
  String get id3 => "_StringExt";
}

extension on String {
  String get id4 => "Unnamed";
}

String foo = "foo";
