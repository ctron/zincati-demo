
/*
const context = {
    newState: {
        reportedState: {
            deployments: [{"version":"37.20221130.dev.1","booted":true,"staged":false,"checksum":"03781edef710bd4a31760259963d720b38f6301e01798bf39b0939c6eeac4d12","baseMetadata":{"stream":"testing-devel"}}]
        }
    }
};
*/

function find(predicate) {
    return context.newState.reportedState?.["deployments"].find(predicate);
}

find(deployment => deployment.staged);
