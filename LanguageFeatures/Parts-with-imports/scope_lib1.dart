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

String libVar = "libVar";
String get libGetter => "libGetter";
var scope = "scope";

String _libVar = "_libVar";
String get _libGetter => "_libGetter";
void set _libSetter(String _) {
  log = "_libSetter";
}
String _libFunc() => "_libFunc";

class LibClass {
  static final String id = "LibClass";
  static final String _id = "LibClass._id";
  final _private = "LibClass._private";
}

mixin LibMixin {
  static final String id = "LibMixin";
  static final String _id = "LibMixin._id";
  final _private = "LibClass._private";
}

class A {}

extension LibExt on A {
  static final String id = "LibExt";
  static final String _id = "LibExt._id";
}

class _LibClass {
  static final String id = "_LibClass";
}

mixin _LibMixin {
  static final String id = "_LibMixin";
}

extension _LibExt on A {
  static final String id = "_LibExt";
}

enum _LibEnum {
  e0;
  static final String id = "_LibEnum";
}

extension type _LibET(int _) {
  static final String id = "_LibET";
}
