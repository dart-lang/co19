/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that XmlSerializer emits a correct namespace 
 * declaration for the <image> element. The first line is serialized as part
 * of a DocumentFragment. The second line is serialized as part of the Document.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var svgDoc = new DomParser()
    .parseFromString('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"></svg>',
        'text/xml');
  var svgEl = svgDoc.firstChild;
  var imageEl = document.createElementNS('http://www.w3.org/2000/svg', 'image');
  imageEl.setAttributeNS('http://www.w3.org/1999/xlink', 'href', 'blah');
  svgEl.append(imageEl);

  var serializer = new XmlSerializer();

  debug(escapeHTML(serializer.serializeToString(svgEl)));
  document.body.append(svgEl..remove());
  debug(escapeHTML(serializer.serializeToString(svgEl)));

  svgEl.remove();
}
