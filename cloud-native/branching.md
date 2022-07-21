# Cloud native Devops AppMode Initiative - Branching

## Solution Reference
- dotnet core solution - [docs](src/dotnet/README.md)
- Helm Charts - [charts](charts)
- nodejs solution - [docs](src/nodejs)

### Branching strategy

Use the branch `cloud-native` as the default branch for the initiative. Don't commit directly to the default branch, use a child branch with convention `cn/*` and raise a PR to the `cloud-native` branch.

For e.g - use branch `cn/adding-k8s-manifest` to make your changesa and raise the PR.