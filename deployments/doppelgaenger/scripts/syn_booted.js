
function find(predicate) {
    return context.newState.reportedState?.["deployments"]?.value?.find?.(predicate);
}

find(deployment => deployment.booted);
