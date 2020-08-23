# lean-build-action

This is a GitHub action for Lean project CI.
At the scheduled time (typically on a push to a branch),
it will try to build the repo as a Lean project.

## Usage

Create a file in your Lean project directory, `/.github/workflows/lean_build.yml`, with contents:

```yaml
on:
  push:

jobs:
  build_project:
    runs-on: ubuntu-latest
    name: Build Lean project
    steps:
      - name: checkout project
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - name: build project
        uses: leanprover-contrib/lean-build-action@master
```

### Advanced notes

This action assumes that you have a `leanpkg.toml` and `src` directory in the root of your repository.
If you have a different setup and would like to use this action,
open an issue and we'll see what we can do to generalize it.

This action is often used in combination with the 
[update versions action](https://github.com/leanprover-contrib/update-versions-action).
If you are using both, we recommend combining them into one workflow:

```yaml
on:
  push:

jobs:
  update_lean_xyz_branch_and_build:
    runs-on: ubuntu-latest
    name: Update lean-x.y.z branch and build project
    steps:

    - name: checkout project
      uses: actions/checkout@v2
      with:
        fetch-depth: 0

    - name: update branch
      if: github.ref == 'refs/heads/master'
      uses: leanprover-contrib/update-versions-action@master

    - name: build project
      uses: leanprover-contrib/lean-build-action@master

```