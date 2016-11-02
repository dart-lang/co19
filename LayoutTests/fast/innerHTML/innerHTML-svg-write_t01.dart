/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that setting innerHTML property works on SVG elements
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  BodyElement body = document.body;

  body.setInnerHtml('''
    <div style="visibility:hidden">
      <svg></svg>
    </div>
  ''', treeSanitizer: new NullTreeSanitizer());

  Element svg = document.getElementsByTagName('svg')[0] as Element;

  svg.innerHtml = "<rect/>";
  shouldBeEqualToString(svg.innerHtml, '<rect></rect>');
  shouldBeEqualToString((svg.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');

  svg.innerHtml = "<radialgradient><stop/></radialgradient>";
  shouldBeEqualToString(svg.innerHtml, '<radialGradient><stop></stop></radialGradient>');
  shouldBeEqualToString((svg.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');
  shouldBeEqualToString((svg.firstChild.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');

  svg.innerHtml = "<textpath><a>x<set></textpath>";
  shouldBeEqualToString(svg.innerHtml, '<textPath><a>x<set></set></a></textPath>');
  shouldBeEqualToString((svg.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');
  shouldBeEqualToString((svg.firstChild.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');

  svg.innerHtml = "<missing-glyph><text>x</missing-glyph>";
  shouldBeEqualToString(svg.innerHtml, '<missing-glyph><text>x</text></missing-glyph>');
  shouldBeEqualToString((svg.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');
  shouldBeEqualToString((svg.firstChild.firstChild as Element).namespaceUri, 'http://www.w3.org/2000/svg');
}

