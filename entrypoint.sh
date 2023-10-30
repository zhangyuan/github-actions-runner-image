#! /bin/bash


function cleanup {
    echo | ./config.sh remove --token "${REGISTRATION_TOKEN}"
}

if [ "$1" = "run" ]; then
    set -euo pipefail

    cd ./actions-runner
    ./config.sh --unattended --url "$REPO_URL" --token "$REGISTRATION_TOKEN" --name "${RUNNER_NAME}" --labels "${RUNNER_LABLES:-dind}" --replace && ./run.sh

    trap cleanup EXIT
else
    set -euo pipefail
    eval $@
fi
