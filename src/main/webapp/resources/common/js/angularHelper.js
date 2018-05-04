/* Common  */
/**
 * AngularHelper : Contains methods that help using angular without being in the scope of an angular controller or directive
 */
var AngularHelper = (function () {
    var AngularHelper = function () { };

    /**
     * ApplicationName : Default application name for the helper
     */
    var defaultApplicationName = "sportApp";

    /**
         * Compile : Compile html with the rootScope of an application
         *  and replace the content of a target element with the compiled html
         * @$targetDom : The dom in which the compiled html should be placed
         * @htmlToCompile : The html to compile using angular
         * @applicationName : (Optionnal) The name of the application (use the default one if empty)
         */
    AngularHelper.Compile = function ($targetDom, applicationName) {
        angular.element($('[ng-app]')).injector().invoke(function ($compile) {
            var scope = $targetDom.scope(); // get scope
            // compile!!!
            setTimeout(function () {
                $compile($targetDom.contents())(scope);
                scope.$digest();
            }, 1000);
        });
    }

    AngularHelper.CompileByTemplateName = function ($targetDom, name, applicationName) {
        // Show modal match finding creation
        common.ui.showLoading();
        $.get('/HtmlTemplate?name=' + name, function (htmlToCompile) {
            $targetDom.html(htmlToCompile);
            AngularHelper.Compile($targetDom);
            common.ui.hideLoading();
        });
    }

    return AngularHelper;
})();