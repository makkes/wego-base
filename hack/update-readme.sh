#!/usr/bin/env bash

apps=$(
    hrfiles=$(
        while IFS= read -r -d '' f ; do 
            yq -e e 'select(.kind=="HelmRelease")' "$f" > /dev/null 2>&1 && echo "$f"
        done < <(find . -name "*.yaml" -not -name "kustomization.yaml" -print0)
    )

    while IFS= read -r -d '' repo ; do
        repo=$(yq e 'select(.kind=="HelmRepository")|({"name":.metadata.name,"url":.spec.url})' "$repo")
        if [[ -n "$repo" ]] ; then
            reponame=$(echo "$repo"|yq .name)
            echo "- [$reponame]($(echo "$repo"|yq .url))"
            echo "$hrfiles" | xargs yq 'select(.spec.chart.spec.sourceRef.name=="'"$reponame"'") | .spec.chart.spec.chart' | \
                xargs printf "  - %s\n"
        fi
    done < <(find . -name "*.yaml" -not -name "kustomization.yaml" -print0)
)

echo "$apps"
