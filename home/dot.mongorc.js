DBQuery.prototype.p = function() {
    var args = arguments
    this.forEach(function(e) {
        var result = {}
        if(args.length == 0) {
            result = e
        } else {
            for(var i = 0; i < args.length; i++) {
                var target = e
                var keys = args[i].split('.')
                var flag = true
                keys.forEach(function(key) {
                    if(key in target) {
                        target = target[key]
                    } else {
                        flag = false
                        return
                    }
                })
                if(!flag) {
                    target = '(undefined)'
                }
                if(args.length == 1) {
                    result = target
                } else {
                    result[[args[i]]] = target
                }
            }
        }
        printjson(result)
    })
}
