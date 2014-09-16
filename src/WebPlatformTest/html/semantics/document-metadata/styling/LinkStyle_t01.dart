/**
 * after web-platform-tests/html/semantics/document-metadata/styling/LinkStyle.html
 * @assertion http://www.w3.org/html/wg/drafts/html/CR/document-metadata.html#styling
 * @description Styling
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String support="$testSuiteRoot/html/semantics/document-metadata/styling/support";

const String htmlEL='''
    <style id="style4" type="text/html">
      #test {
        height: 100px;
        width: 100px;
      }
    </style>
    <style id="style7" type="text/css" media="all" title="$support/alternate.css">
      #test {
        background-color: green;
      }
    </style>
    <link id="style1" rel="text" title="Intel" href="$support/unmatch.css">
    <link id="style2" rel="alternate stylesheet" type="text/css" title="" href="$support/emptytitle.css">
    <link id="style3" rel="alternate stylesheet" type="text/css" href="$support/notitle.css">
    <link id="style5" rel="stylesheet" type="text/css" href="$support/normal.css">
    <link id="style6" rel="alternate stylesheet" type="text/css" href="$support/normal.css" title="$support/alternate.css">
''';

void main() {
      document.body.appendHtml(htmlEL);
      
      test(() {
        var style = null;
        for (int i = 1; i < 5; i++) {
          style = document.getElementById("style$i");
          assert_equals(style.sheet, null, "The sheet attribute of style$i should be null.");
          assert_false(style.disabled, "The disabled attribute of style$i should be false.");
        }
      }, "The LinkStyle interface's sheet attribute must return null; the disabled attribute must be false");

      test(() {
        var style = document.createElement("style"),
            link = document.createElement("link");
        assert_equals(style.sheet, null, "The sheet attribute of the style element not in a document should be null.");
        assert_equals(link.sheet, null, "The sheet attribute of the link element not in a document should be null.");
      }, "The LinkStyle interface's sheet attribute must return null if the corresponding element is not in a Document");

      test(() {
        var style = null;
        for (int i = 5; i < 8; i++) {
          style = document.getElementById("style$i");
     print("style$i is ${style.runtimeType}, style.sheet is ${style.sheet.runtimeType}");
          assert_true(style.sheet is StyleSheet, "The sheet attribute of style$i should be a StyleSheet object.");
          assert_equals(style.disabled, style.sheet.disabled, "The disabled attribute of style$i should equal to the same attribute of StyleSheet.");
        }
      }, "The LinkStyle interface's sheet attribute must return StyleSheet object; the disabled attribute must be same as the StyleSheet's disabled attribute");

      test(() {
        assert_equals(document.getElementById("style2").title, "", "The title attribute of style2 is incorrect.");
        assert_equals(document.getElementById("style5").title, "", "The title attribute of style5 is incorrect.");
        assert_equals(document.getElementById("style6").title, "$support/alternate.css", "The title attribute of style6 is incorrect.");
        assert_equals(document.getElementById("style7").title, "$support/alternate.css", "The title attribute of style7 is incorrect.");
      }, "The title must be the same as the value of the element's title content attribute");

      test(() {
        assert_equals(document.getElementById("style5").media, "", "The media attribute of style5 is incorrect.");
        assert_equals(document.getElementById("style7").media, "all", "The media attribute of style7 is incorrect.");
      }, "The media must be the same as the value of the element's media content attribute, or the empty string if it is omitted");
  
   checkTestFailures();
}
