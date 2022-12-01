function find(predicate) {
    return context.newState.reportedState?.["deployments"]?.value?.find?.(predicate);
}

const deployment = find(deployment => deployment.booted);

let result;

if (deployment !== null) {
    result = {version: deployment.version, checksum: deployment.checksum};
}


result
