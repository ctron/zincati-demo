
function find(predicate) {
    return context.newState.reportedState?.["deployments"]?.find?.(predicate);
}

find(deployment => deployment.booted);
