// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Metadata can appear before  ...  part header ...
///
/// @description Check that metadata is allowed before part header
/// @author a.semenov@unipro.ru

@Deprecated('before_lib2_p01') @A<int>(42)
part of 'before_part_header_lib1.dart';

int i = 0;

class A<T> {
  const A(T t);
}
