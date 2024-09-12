// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Compiling a part directive of the form `part s;` causes the Dart
/// system to attempt to compile the contents of the URI that is the value of
/// `s`. The top-level declarations at that URI are then compiled by the Dart
/// compiler in the scope of the current library.
///
/// @description Checks that more than one part can be included in a library
/// without errors as long as there are no name conflicts.

part of 'compilation_t04.dart';

class A { }

get value { return _value; }
set value(value) { _value = value; }
var _value;
