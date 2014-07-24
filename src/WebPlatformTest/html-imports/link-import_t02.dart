/**
 * after web-platform-tests/html-imports/link-import.html
 * @assertion https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/imports/index.html#loading-imports
 * @description Check on dynamically inserted element. The import should be loaded even for dynamically added links.  
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

const String resources = '${testSuiteRoot}/html-imports/resources';

void main() {
    
      var retries = 50;
      var linkToBeInserted = document.createElement("link");
      linkToBeInserted.setAttribute("rel", "import");
      linkToBeInserted.setAttribute("href", "$resources/another.html");
      void checkAndDoneOncePassed() {
          var loaded = linkToBeInserted.import is DocumentFragment;
          if (loaded) {
            return;
          }
    
          retries--;
          if (retries <= 0) {
            Expect.fail("Too many retries.");
            return;
          }
    
          runLater(checkAndDoneOncePassed, 10);
      };
    
      checkAndDoneOncePassed();
}
