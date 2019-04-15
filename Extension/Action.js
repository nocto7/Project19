var Action = function() {};

Action.prototype = {
    
run: function(parameters) {
    parameters.completionFunction({"URL": document.URL, "title": document.title });
},
    
finalize: function(parameters) {
    var customJS = parameters["customJS"];
    eval(customJS);
}
    
};


var ExtensionPreprocessingJS = new Action
