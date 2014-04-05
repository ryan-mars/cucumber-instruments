var target = UIATarget.localTarget();
var host = target.host();

UIALogger.logDebug("Should match logElementTree above.");
UIALogger.logDebug("-----------------------------------------");
UIATarget.localTarget().logElementTree();
UIALogger.logDebug("-----------------------------------------");
