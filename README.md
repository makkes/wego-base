# Repository for quickly bootstrapping a Kubernetes cluster

## Quickstart

1. Clone this repository
1. `kind create cluster`
1. `export GITHUB_TOKEN=<A PERSONAL ACCESS TOKEN>`
1. `export OWNER=<YOUR GITHUB HANDLE>`
1. `export REPO=<REPO NAME>`
1. `export PRIVATE=<TRUE OR FALSE, DEPENDING ON YOUR REPO VISIBILITY>`
1. `flux bootstrap github --owner=$OWNER --repository=$REPO --private=$PRIVATE --path=clusters/dev`

## Available apps

All apps' manifests are stored in `apps/`. These are the available apps in that directory:

<!-- APPS -->
- Repository: https://kubernetes.github.io/ingress-nginx
  - ingress-nginx
- Repository: https://metallb.github.io/metallb
  - metallb
- Repository: https://prometheus-community.github.io/helm-charts
  - kube-prometheus-stack
<!-- APPS -->

## Environments

All environments are stored in the `clusters/` directory, each serving different purposes.

## Enabling/disabling an app

Add or remove the relative path to the app in `clusters/<ENV>/apps/kustomization.yaml`.
