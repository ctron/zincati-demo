function find(predicate) {
    return context.newState.reportedState?.["deployments"]?.value?.find?.(predicate);
}

const deployment = find(deployment => deployment.staged);

let result;

if (deployment !== undefined) {
    result = {version: deployment.version, checksum: deployment.checksum};
}

result
