/**
 * after web-platform-tests/html/syntax/parsing/Document.getElementsByTagName-foreign-02.html
 * @assertion
 * <link rel="help" href="https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementsbytagname">
 * <link rel="help" href="http://www.whatwg.org/html/#parsing">
 * @description getElementsByTagName and font 
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<font></font>
<svg><font/></svg>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL);
  
    var HTML = "http://www.w3.org/1999/xhtml", SVG = "http://www.w3.org/2000/svg";
    test(() {
      assert_equals(document.getElementsByTagName("FONT").length, 1);
      assert_equals(document.getElementsByTagName("FONT")[0].namespaceUri, HTML);
    }, "Upper-case font");
    
    test(() {
      assert_equals(document.getElementsByTagName("font").length, 2);
      assert_equals(document.getElementsByTagName("font")[0].namespaceUri, HTML);
      assert_equals(document.getElementsByTagName("font")[1].namespaceUri, SVG);
    }, "Lower-case font");

    checkTestFailures();
}
