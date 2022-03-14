from sphinxcontrib.domaintools import custom_domain

def setup(app):
    app.add_domain(custom_domain('ObjectiveCDomain',
        name  = 'objc',
        label = "Objective-C",

        # elements = dict(
        #     class = dict(
        #         objname  = "Make Target",
        #     ),
        #     var   = dict(
        #         objname = "Make Variable",
        #         indextemplate = "pair: %s; Make Variable"
        #     ),
        # )))

        elements = {
            "class" : {
                "objname" : "Objective-C Class",
            },
            "method" : {
                "objname" : "Objective-C Method"
            }
        }
    ))

    return {
        'version': '0.1',
    }