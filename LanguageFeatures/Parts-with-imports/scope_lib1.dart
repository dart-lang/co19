// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for `scope*` tests.
///
/// @description Common library for `scope*` tests.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'scope_lib1_part.dart';

String log = "";

String libVar = "scope_lib1 libVar";
String get libGetter => "scope_lib1 libGetter";
var scope = "scope_lib1";

String _libVar = "scope_lib1 _libVar";
String get _libGetter => "scope_lib1 _libGetter";
void set _libSetter(String _) {
  log = "scope_lib1 _libSetter";
}
String _libFunc() => "scope_lib1 _libFunc";

class LibClass {
  static final String id = "scope_lib1 LibClass";
  static final String _id = "scope_lib1 LibClass._id";
  final _private = "scope_lib1 LibClass._private";
}

mixin LibMixin {
  static final String id = "scope_lib1 LibMixin";
  static final String _id = "scope_lib1 LibMixin._id";
  final _private = "scope_lib1 LibClass._private";
}

class A {}

extension LibExt on A {
  static final String id = "scope_lib1 LibExt";
  static final String _id = "scope_lib1 LibExt._id";
}

class _LibClass {
  static final String id = "scope_lib1 _LibClass";
}

mixin _LibMixin {
  static final String id = "scope_lib1 _LibMixin";
}

extension _LibExt on A {
  static final String id = "scope_lib1 _LibExt";
}

enum _LibEnum {
  e0;
  static final String id = "scope_lib1 _LibEnum";
}

extension type _LibET(int _) {
  static final String id = "scope_lib1 _LibET";
}
