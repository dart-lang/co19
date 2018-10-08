/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * @needsreview can custom svg element be created
 */
import "dart:html";
import "dart:svg";
import "../../../resources/testharness.dart";

class CustomSvgElement extends GElement {
  static const tag = 'svg-foo';
  factory CustomSvgElement() => new SvgElement.tag(tag);
  CustomSvgElement.created() : super.created();
}

main() {
  test(() {
    assert_throws(() {
      document.register('x-foo', CustomSvgElement);
    }, 'register of an SVG element requires the extends parameter');

    document.register('x-foo', CustomSvgElement, extendsTag: 'g');

    var created = new CustomSvgElement();
    assert_true(created is GElement, 'created element should be an SVG element');
  }, 'registration of SVG types');
}
