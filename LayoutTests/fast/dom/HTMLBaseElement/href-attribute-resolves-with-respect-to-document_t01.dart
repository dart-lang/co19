/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.head.append(new Element.html('<base href="foo/bar/">',
        treeSanitizer: new NullTreeSanitizer()));

  endsWith(string, substring)
  {
    var length = string.length - substring.length;
    return length >= 0 && string.indexOf(substring, length) == length;
  }

  var base = document.querySelector('base');
  shouldBeTrue(endsWith(document.querySelector('base').href, 'foo/bar/'));
  shouldBeFalse(endsWith(document.querySelector('base').href, 'foo/bar/foo/bar/'));
  
  //base.href = null;
  //shouldBeTrue(endsWith(document.querySelector('base').href, '/null'));

  // When a document does not have a URL, base cannot be resolved

  // Make sure that we don't use the creator document as the base.
  var documentWithoutAView = document.implementation.createHtmlDocument('');
  base = documentWithoutAView.head.append(documentWithoutAView.createElement('base'));
  base.setAttribute('href', 'foo/bar/');
  shouldBeEqualToString(documentWithoutAView.querySelector('base').href, '');

  base.setAttribute('href', 'http://webkit.org/');
  shouldBeEqualToString(documentWithoutAView.querySelector('base').href, 'http://webkit.org/');

  // Make sure that we don't use the opener document as the base.
  //var newWindow = window.open('about:blank', '');
  //base = newWindow.document.head.append(newWindow.document.createElement('base'));
  //base.setAttribute('href', 'foo/bar/');
  //shouldBeEqualToString(newWindow.document.querySelector('base').href, '');
  //newWindow.close();
}
