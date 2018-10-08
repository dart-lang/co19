/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests DomParser supports creating Document for Html
 * content with mime-type "text/html
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var htmlContent =
    "<html>" +
        "<head>" +
            "<noscript>" +
                "Scripts must be disabled for the document created using DomParser.parseFromString()" +
            "</noscript>" +
        "</head>" +
        "<body>" +
            "<div id='text'>Sample text content</div>" +
            "<script>document.getElementById('text').textContent = 'Modified text content';<\/script>" +
        "</body>" +
    "</html>";

  var xmlContent =
    "<root>" +
    "</root>";

  var xhtmlContent =
    "<!DOCTYPE html>" +
    "<html xmlns=\"http://www.w3.org/1999/xhtml\">" +
        "<head>" +
            "<title>Title of document</title>" +
            "<noscript>" +
                "Scripts must be disabled for the document created using DomParser.parseFromString()" +
            "</noscript>" +
        "</head>" +
        "<body>" +
            "<div id='text'></div>" +
            "<script>document.getElementById('text').textContent = 'Newly added text';<\/script>" +
        "</body>" +
    "</html>";

  var svgImageContent =
    "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">" +
        "<circle cx=\"100\" cy=\"50\" r=\"40\" stroke=\"black\" stroke-width=\"2\" fill=\"red\"/>" +
    "</svg>";

  var xslContent =
    "<?xml version=\"1.0\"?>" +
    "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">" +
        "<xsl:template match=\"/\">" +
            "<html>" +
                "<head>" +
                    "<title>XML XSL Example</title>" +
                    "<style type=\"text/css\">" +
                        "body" +
                        "{" +
                            "background-color:red;" +
                        "}" +
                    "</style>" +
                "</head>" +
                "<body>" +
                    "<xsl:apply-templates/>" +
                "</body>" +
            "</html>" +
        "</xsl:template>" +
        "" +
        "<xsl:template match=\"tutorial\">" +
            "<span><xsl:value-of select=\"name\"/></span>" +
            "<span><xsl:value-of select=\"url\"/></span>" +
        "</xsl:template>" +
    "</xsl:stylesheet>";

  shouldSupport(content, mimeType, [expected])
  {
    debug(mimeType);

    var parser = new DomParser();
    var resultDocument = parser.parseFromString(content, mimeType);

    shouldBeNonNull(resultDocument);

    var docElement = resultDocument.documentElement;

    if (mimeType.lastIndexOf("xml") == mimeType.length - 3) {
      shouldBe(docElement.tagName, expected);
    }
  }

  shouldThrowException(content, mimeType)
  {
    debug(mimeType);

    var parser = new DomParser();
    shouldThrow(() {
      parser.parseFromString(content, mimeType);
    }, (e) => e is DomException && e.name == 'TypeError');
  }

  shouldSupport(htmlContent, "text/html");
  shouldSupport(xmlContent, "text/xml", 'root');
  shouldSupport(xmlContent, "application/xml", 'root');
  shouldSupport(xhtmlContent, "application/xhtml+xml", 'html');
  shouldSupport(svgImageContent, "image/svg+xml", 'svg');

  shouldThrowException(xslContent, "text/xsl");
  shouldThrowException(xmlContent, "text/dummy+xml");
  shouldThrowException(xmlContent, "text/XML");
  shouldThrowException(xmlContent, "TEXT/html");
}
